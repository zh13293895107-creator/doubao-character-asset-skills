---
name: photoreal-garment-plate
description: 服装资产/角色戏服（garment / costume reference plate）写实摄影提示词生成器。当用户上传一张人物穿着服装的图片（漫画/动漫/游戏立绘/插画、油画/水彩/古典绘画、3D/CG渲染、真人照片/影视剧照、cosplay 或手办照片等任意媒介），要求产出服装提示词、衣服设计转写实、戏服真人化、真实面料服装、garment prompt、costume plate、服装资产图时使用。核心能力：实际读取并分析图片中服装的廓形、剪裁、比例、长度、领型袖型、门襟开合、结构细节、颜色图案与面料倾向，剥离原图媒介、人物身体与五官，把非现实服装（浮空件、魔法光效、夸张结构）转译为真实裁缝/戏服师可制作的真实服装，输出固定格式的英文写实摄影提示词；强制 9:16 竖幅全身正面、服装穿在无五官无头发的白色哑光塑料假人模特身上、真实面料材质、中性无影后期友好光、浅灰无缝背景；无论输入什么媒介，输出永远是真实服装的照片而非画作。
---

# Photoreal Garment Plate — 写实服装资产提示词

把任意媒介人物身上的服装，转译成一张「无五官白色塑料假人全身穿着、真实面料、可制作」的服装参考板照片级英文提示词。产物是可直接复制投喂图像模型的完整 Prompt，不是分析报告。

## 不可违背的硬约束

1. **产物永远是真实服装照片**：photorealistic garment photograph，必须显式声明 "Photographed, not rendered"；Negative 中穷举否定原图媒介。
2. **服装只穿在白色塑料假人身上**：smooth featureless white plastic mannequin——无五官（无眼、无鼻、无嘴的空白脸）、无头发、无皮肤、无真人、无关节外露；禁止真人模特、人偶玩具、衣架、平铺、ghost mannequin。
3. **9:16 竖幅全身**：vertical 9:16 full-length，正面站立，服装从领/肩到下摆完整入镜，假人全身（含脚）居中。用户若调用生图工具，画幅参数必须设 9:16（如 1152×2048 / 1080×1920）；提示词文本同时写明构图要求。
4. **只继承服装设计，不继承其他**：只取廓形、剪裁、比例、长度、领/袖/门襟、结构细节、颜色图案、面料倾向；禁止继承人物身份、脸、身材、姿势、画风、笔触、二次元光影、原画光照、背景。
5. **真实材质、可制作、物理合理**：一切服装必须是真实纤维/皮革/金属等材料制成、真实裁缝工艺可实现、符合重力与人体结构；浮空件、魔法光效、发光纹、反重力飘摆、无支撑结构必须按《奇幻转译规则》落地为真实结构，转译不了的特效直接删除。
6. **后期友好光源**：大面积柔和漫射光，均匀干净、无色偏、无硬投影、无戏剧性光斑；白塑料保持哑光无镜面反射；面料织纹清晰可读；光平到可后期抠图与重打光。
7. **提示词语言为英文**，段标签固定（Garment / Material / Colour & Pattern / Construction / Fit & Drape / Mannequin / Framing / Lighting / Background / Lens / Technical / Negative）；与用户的中文沟通可保留中文。
8. **提示词必须基于对图片的实际观察**，逐件描述；图中被遮挡看不清的结构，用最常见、最合理的成衣处理，不得编造装饰。

## 工作流程

### 1. 读图（必须实际打开图片）

- 本地路径：直接 Read；URL：先下载到本地（PowerShell 用 Invoke-WebRequest -Uri "<url>" -OutFile "<local>"）再 Read。
- 服装细节看不全时：放大重看或分区裁剪（领口、门襟、袖口、腰头、下摆、面料区域、图案区域）。
- 多图：正面全身图为主；背面/侧面图只用于补后背与侧缝结构；不同季/不同套装不得混为一件。

### 2. 判定输入媒介

| 类型 | 典型特征 |
|---|---|
| illustrated | 动漫、漫画、赛璐璐、游戏立绘、二次元插画、扁平插画 |
| painted | 油画、水彩、古典肖像、厚涂、国风工笔 |
| rendered | 3D 渲染、游戏引擎截图、虚拟人、手办渲染图 |
| photo | 真人照片、影视剧照、cosplay、秀场图、成衣电商图 |
| sculpted | 手办、BJD、雕塑、玩偶实物照片 |

从 references/garment-template.md「媒介适配段」取对应隔离措辞与否定词。

### 3. 逐件拆解服装（按清单）

先分清**件数与层次**：外套 / 上衣 / 衬衫 / 马甲 / 裤 / 裙 / 连体服 / 连衣裙 / 内衣外穿层 / 配饰（帽、围巾、腰带、手套、披风、腿套、包），由外到内逐件记录，每件过下列 12 项：

1. **品类与性别板型**：男装板 / 女装板 / 中性板（决定 male / female / androgynous dress form）。
2. **廓形 silhouette**：fitted / tailored / slim / regular / relaxed / oversized / boxy / A-line / flared / draped / cocoon / trapeze。
3. **长度与比例**：衣长（cropped / hip / thigh / knee / calf / ankle / floor）、袖长（sleeveless / short / elbow / long / thumb-hole）、裤长裙长、腰线（high / natural / low / dropped）、开衩高度。
4. **领型**：crew / V-neck / U-neck / turtleneck / mock neck / polo / shirt collar / camp collar / lapel（notch/peak/shawl）/ mandarin / hood / off-shoulder / square / sailor。
5. **肩与袖结构**：set-in / raglan / dolman / dropped shoulder / puff / bishop / bell / cape sleeve；肩章、垫肩、泡泡肩。
6. **门襟与开合**：pullover / zip / button（single/double-breasted，扣数）/ snap / hook-and-eye / laces / wrap / buckle / Velcro 禁止。
7. **结构细节**：省道、褶裥、抽褶、荷叶边、披风片、肩带、腰带、抽绳、罗纹收边、袖口、口袋（patch/welt/ cargo）、开衩、 vents、里衬、绗缝。
8. **面料材质**（写真实面料，见词库）：纤维（棉/麻/羊毛/丝/皮革/丹宁/针织/尼龙/聚酯/金属…）、织法（jersey/twill/tweed/denim/satin/velvet/mesh/knit/rib/brocade/lace）、厚薄克重感、软硬挺括度、光泽（matte/satin/sheer）。
9. **颜色**：逐件给主色与辅色（用具体色名：charcoal / ivory / burgundy / olive drab…），标注配色分区。
10. **图案与装饰**：solid / heather / stripe / plaid / argyle / floral / camo / graphic；区分真实实现方式——woven jacquard / embroidery / screen print / appliqué / beading / studding / distressing / patchwork。
11. **做旧与状态**：new / washed / faded / worn / distressed / frayed / weathered / polished armour。
12. **鞋与配饰**：鞋若属整套设计则逐双描述；否则默认假人赤脚（featureless plastic feet）。帽/手套/腰带/披风等纳入设计的逐件描述，不纳入的一律不出现。

### 4. 奇幻转译（illustrated / rendered / painted 几乎必做）

读取 references/garment-template.md「奇幻转译规则」。原则：

- 浮空翻领、无支撑披风角、悬浮饰片 → 加真实支撑（wire 边缘、衬里、鱼骨、重垂面料、暗扣、肩带）。
- 发光纹路 / 能量光效 → 删除光效，改为哑光刺绣、提花、织唛、金属线绣、压纹、皮雕。
- 金属胸甲 / 铠甲比基尼 → 改为真实分层：皮革/金属甲片缝合或铆接在底衣与衬垫上，保留重量与搭接逻辑。
- 反重力大飘摆 → 静态自然垂坠，只保留自然褶皱。
- 夸张尖肩 / 几何肩甲 → 保留廓形，用垫肩、肩章、硬质衬或轻型甲片实现。
- 薄纱不穿帮 → 给出真实层数与底衣。
- 所有拉链、纽扣、系带、缝线必须真实存在、位置合理。

### 5. 套模板生成

读取 references/garment-template.md，按 14 段顺序组装：Opening → Mannequin → Reference directive → Garment（分层逐件）→ Material → Colour & Pattern → Construction → Fit & Drape → Framing（9:16）→ Lighting（锁定）→ Background（锁定）→ Lens（锁定）→ Mannequin Surface（锁定）→ Technical + Negative。

描述风格：名词短语堆叠、一件一件写、每件先品类后廓形再细节；材质词具体到纤维与织法；不写形容词堆砌与文学修饰。

### 6. 自检后交付

输出前逐条过模板末尾自检清单；完整提示词放在一个代码块中给出。多套服装时每套独立成段；用户要求背面/侧面/细节机位时，另出独立提示词（仍锁定 9:16 与假人）。

## 与用户的边界

- 只产出提示词，不调用生图工具，除非用户另外明确要求；出图时画幅强制 9:16。
- 用户要求换色、换面料、换角度、加细节时，只改对应段，锁定段原样保留。
- 涉及真实品牌的 Logo、标志性印花、制服徽章时，不做逐字复刻，改为中性描述。
- 真人照片参考不得出现人物姓名或身份；只描述可见的服装。
