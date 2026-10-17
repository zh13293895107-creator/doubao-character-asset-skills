---
name: photoreal-face-plate
description: 人脸资产/角色定妆照（character reference plate）写实摄影提示词生成器。当用户上传一张人物图片（真人照片、油画/水彩等传统绘画、动漫/插画/立绘、3D/CG渲染、雕塑/BJD/玩偶等任意媒介），要求产出人脸资产提示词、面部参考板、角色转写实、真人化、photoreal portrait prompt、face reference plate 时使用。核心能力：实际读取并分析图片中人物的面部结构与身份特征（五官比例、脸型、眼距、鼻型、唇形、发际线与发流、颈肩构建），剥离原图媒介与画风，输出固定格式、可直接复制给图像生成模型的英文写实摄影级 head-and-shoulders 肖像提示词，强制中性表情、直视镜头、哑光皮肤、无油光、无影中性光、中灰无缝背景；无论输入什么媒介，输出永远是照片而非画作。
---

# Photoreal Face Plate — 写实人脸资产提示词

把任意媒介的人物图，转译成一张「中性角色参考板照片」级别的英文提示词。产物是一段可直接复制投喂图像模型的完整 Prompt，不是分析报告。

## 不可违背的硬约束

1. **产物永远是照片**：无论输入是油画、动漫、3D 还是照片，输出统一为 photorealistic photograph；必须显式声明 "Photographed, not rendered"，并在 Negative 中穷举否定原图媒介。
2. **只继承身份，不继承媒介**：从参考图只取面部结构、比例、五官形状、发际线与发流、颈肩构建；禁止继承画风、笔触、调色、光照、背景、材质、夸张比例。
3. **皮肤哑光、零油光**：no oily sheen / no specular hotspots / no sweaty or waxy shine；允许自然 subsurface 质感，但不得出现任何镜面高光块或面部反光白斑。
4. **后期友好光源（用户硬性要求）**：均匀、柔和、无影、无色偏的中性漫射光；禁止方向性投影、鼻影/颧骨阴影、轮廓光、背光、环境色反弹、面部过曝白斑；光必须平到可在后期随意重打光与合成，不携带任何 baked-in 光影。眼神光仅允许小而中性的 catch-light。
5. **固定标准不随图改**：机位（head-and-shoulders、straight to camera、eye level）、中性表情、中灰无缝背景、85mm 镜头、35mm 细颗粒、毛孔级皮肤、无文字水印——锁定段落措辞见模板，每张图原样保留。
6. **提示词语言为英文**，段标签使用 Identity / Lighting / Background / Lens / Skin / Technical / Negative 等固定英文标签；与用户的中文沟通可保留中文。
7. **提示词必须基于对图片的实际观察**，禁止凭空编造五官；图中看不清或被遮挡的项，用最中性、最普通的描述，不得发挥。

## 工作流程

### 1. 读图（必须实际打开图片）

- 本地路径：直接 Read。
- URL：先下载到本地（PowerShell 用 Invoke-WebRequest -Uri "<url>" -OutFile "<local>"），再 Read 本地文件，禁止凭 URL 直接描述。
- 缩略图不清晰时：放大 thumbnail_size 重看，或分区裁剪放大面部，重点确认眼型/眼距、鼻型、唇形、发际线、下颌线。
- 多张图：以正面、最清晰、最接近平视的一张为身份基准；其余只用于补足发型或侧面结构，不混用服装与表情。

### 2. 判定输入媒介

从下列五类中选定一类（决定参考隔离段与 Negative 措辞）：

| 媒介类型 | 典型特征 |
|---|---|
| painted | 油画、水彩、丙烯、厚涂、国画等传统/手绘绘画 |
| illustrated | 动漫、赛璐璐、漫画、游戏立绘、二次元插画、扁平插画 |
| rendered | 3D 渲染、CGI、手办渲染图、虚拟人、游戏引擎截图 |
| photo | 真人照片、影视剧照 |
| sculpted | 雕塑、BJD、蜡像、玩偶、面具、实体手办照片 |

判定后读取 references/prompt-template.md 中「媒介适配段」词库，取对应措辞。

### 3. 按清单提取身份特征

逐项观察并记录（内部中文速记，产出转英文）：

1. **人口学**：表观年龄段（child / boy / girl / teenager / young adult / middle-aged / elderly）、性别、族裔或地域特征（如 Russian / East Asian / Nordic / Latin / North African）。
2. **头脸构建**：头型大小、脸型（round / oval / long / square / heart-shaped / narrow）、额头、颧骨、脸颊（饱满/凹陷）、下颌线（soft unformed / sharp defined / square）、下巴（small / pointed / round / broad / cleft）。
3. **眼**：大小、眼型（round / almond / narrow / hooded / deep-set / protruding）、眼距、单/双眼皮、眼色、眉形与浓淡。
4. **鼻**：鼻梁（straight / high / low / aquiline / button）、鼻头、鼻翼宽窄。
5. **嘴**：唇厚、唇形、嘴宽、嘴角走向。
6. **皮肤**：肤色（pale / fair / light tan / olive / brown / dark）与冷暖倾向；输出统一为干净无瑕疵皮肤，原图的痣、斑、疤、浓妆、晒伤一律不继承（符合年龄的自然皱纹可中性保留）。
7. **毛发**：发色、发质（straight / wavy / curly / coarse / fine）、发量、发际线形状、刘海/发流方向、鬓角、胡须（有则中性描述，无则写明 no facial hair）。
8. **颈肩身形**：脖子长短粗细、肩宽（narrow / average / broad）、整体 build（slight / slender / average / stocky / heavy）。
9. **表情**：一律改写为中性闭合表情（模板锁定），原图笑容、怒容、夸张神态不继承。
10. **服装**：默认替换为素色浅灰圆领卫衣（plain light grey crew-neck sweatshirt），仅领口露出画面底边；用户明确要求保留角色服装时，再按其要求中性描述，仍禁止花纹、Logo、时代符号。

### 4. 套模板生成

读取 references/prompt-template.md，严格按其 11 段顺序与措辞组装：

1. Opening 定调
2. Reference directive（媒介隔离）
3. Identity
4. Expression
5. Eyes
6. Wardrobe
7. Lighting（后期友好中性光，锁定）
8. Background（中灰无缝，锁定）
9. Lens（85mm，锁定）
10. Skin（毛孔级 + 哑光，锁定）
11. Technical + Negative（媒介否定随第 2 步切换）

身份描述遵循模板词库风格：**名词短语堆叠、前置限定词、具体而克制**，每句只承载一个特征，不写文学修饰。

### 5. 自检后交付

输出前逐条过 references/prompt-template.md 末尾的自检清单；产物放在一个代码块中整体给出，正文不夹带解释。用户要求多角色/多角度时，每个角色或机位各出一段独立提示词。

## 与用户的边界

- 只产出提示词，不调用生图工具，除非用户另外明确要求出图。
- 用户要求改图（换表情、换服装、换机位、换光照）时，只调整对应段落，其余锁定段原样保留。
- 参考图为真人照片时，不得生成或暗示任何真实在世人物的姓名、身份；只描述可见的面部特征。
