# 写实人脸资产提示词模板（英文产物）

组装规则：严格按 11 段顺序；`[方括号]` 为按观察替换的占位符；标注 **[LOCKED]** 的段落原样保留，只允许按用户明确要求改机位/服装；Reference 段与 Negative 段按媒介类型切换。

## 目录

- [一、完整模板](#一完整模板)
- [二、媒介适配段](#二媒介适配段)
- [三、锁定段标准措辞](#三锁定段标准措辞)
- [四、身份词库](#四身份词库)
- [五、Golden Sample（质量基准）](#五golden-sample质量基准)
- [六、交付前自检清单](#六交付前自检清单)

---

## 一、完整模板

```
Photorealistic head-and-shoulders portrait. Neutral character reference plate, straight to camera, eye level. Photographed, not rendered — a real photograph of a real face.

<<<REF>>> is [MEDIA DECLARATION]. Use it for identity only: the structure and proportions of the face, the shape of the head, the set and spacing of the eyes, the shape of the nose and chin, the hairline and the way the hair falls, the build of the neck and shoulders. Do not inherit [MEDIA STRIP LIST]. Translate this exact person from [SOURCE MEDIUM] into a photograph, with natural photographic proportions.

Identity: [BUILD/shoulders + apparent age + ethnicity + gender] with [complexion], [hair colour/texture/flow] hair, and [eye size/colour] eyes. [cheeks], [chin], [jaw], [skin/facial-hair statement].

Expression: neutral closed expression — mouth relaxed, not smiling, not frowning, eyes open and level, looking directly into the lens.

Eyes: wet living eyes with small, natural, neutral catch-lights.

Wardrobe: the collar of a plain light grey crew-neck sweatshirt just visible at the bottom of frame. Nothing else in the frame.

Lighting: [LOCKED — 见三]

Background: [LOCKED — 见三]

Lens: [LOCKED — 见三]

Skin: [LOCKED — 见三]

Technical: [LOCKED — 见三]

Negative: [COMMON NEGATIVES] + [MEDIA NEGATIVES]. Not an artwork of [the person]. A photograph of [the person].
```

写法要点：

- Identity 段是一长串名词短语，特征按「身形人口学 → 肤色 → 头发 → 眼睛 → 脸颊 → 下巴 → 颌线 → 皮肤毛发」的顺序排，与 Golden Sample 一致。
- 每个特征只写一次，用逗号并列；不用长从句、不写形容词堆砌超过 2 个。
- `<<<REF>>>` 保留为参考图占位标记；若平台不支持该写法，改为 "the reference image"。
- 性别与年龄用图中可见的事实，不确定族裔时可省略族裔，不要猜。

---

## 二、媒介适配段

### 1. painted（油画/水彩/丙烯/厚涂/国画）

- MEDIA DECLARATION：`a painted character design`（已知具体画种时改 `an oil painting` / `a watercolour` / `an acrylic painting`）
- MEDIA STRIP LIST：`its medium, its brushwork, its texture, its palette, its lighting or its background`
- SOURCE MEDIUM：`an oil painting`（随画种替换）
- 结尾断言：`Not an artwork of the boy. A photograph of the boy.`（人称随角色替换）
- MEDIA NEGATIVES：`no painting, no oil paint, no watercolour, no brushstrokes, no brush texture, no impasto, no canvas or paper texture, no painterly skin, no visible strokes in the hair, no fine-art illustration, no fine-art portrait`

### 2. illustrated（动漫/赛璐璐/漫画/立绘/扁平插画）

- MEDIA DECLARATION：`a 2D illustrated anime-style character design`
- MEDIA STRIP LIST：`its medium, its line art, its cel shading, its flat colour fills, its stylised and exaggerated proportions, its palette, its lighting or its background`
- SOURCE MEDIUM：`a 2D illustration`
- MEDIA NEGATIVES：`no illustration, no anime, no manga, no cartoon, no cel shading, no line art, no ink outlines, no flat colour fills, no sticker-like shading, no stylisation, no cartoon proportions, no oversized or enlarged eyes, no tiny simplified nose, no pointed anime chin, no sparkly anime eyes`

### 3. rendered（3D/CGI/虚拟人/游戏引擎）

- MEDIA DECLARATION：`a 3D rendered character`
- MEDIA STRIP LIST：`its CG medium, its plastic skin shader, its render artefacts, its stylised topology, its palette, its engine lighting or its background`
- SOURCE MEDIUM：`a 3D render`
- MEDIA NEGATIVES：`no 3D, no CGI, no CG, no render, no ray-traced look, no game engine, no unreal engine look, no plastic skin, no vinyl skin, no doll-like skin, no subsurface artefacts, no virtual human, no video-game character, no smoothed plastic skin`

### 4. photo（真人照片/剧照）

- MEDIA DECLARATION：`a photograph of the person`
- MEDIA STRIP LIST：`its camera angle, its pose, its expression, its makeup, its retouching, its lighting, its colour grade or its background`
- SOURCE MEDIUM 句改为：`Re-shoot this exact person as a neutral studio reference plate, with natural photographic proportions.`
- 不需要媒介否定；结尾断言句整句删除（不能说"不是照片"）。
- COMMON NEGATIVES 保留，并补：`no beauty-filter skin, no glamour retouching, no makeup-heavy look, no candid snapshot`

### 5. sculpted（雕塑/BJD/蜡像/手办/玩偶）

- MEDIA DECLARATION：`a sculpted figurine of a character`（按实物改 `a resin doll` / `a wax figure` / `a clay sculpture`）
- MEDIA STRIP LIST：`its sculpted medium, its clay or resin surface, its painted finish, its mould seams and joints, its stylisation, its lighting or its background`
- SOURCE MEDIUM：`a sculpted figure`
- 转换句加强：`Translate this exact person from a sculpted figure into a photograph of a living human being, with natural photographic proportions and real skin.`
- MEDIA NEGATIVES：`no sculpture, no statue, no bust, no figurine, no doll, no BJD, no action figure, no waxwork, no mannequin, no clay, no resin, no porcelain, no vinyl, no painted-on features, no mould seams, no jointed limbs, no toy, no still life of an object`

---

## 三、锁定段标准措辞

### Lighting [LOCKED]（后期友好，哑光，零油光）

```
Lighting: soft, flat, even, shadowless reference light — large diffused sources wrapping the face from front and slightly above, matched gentle fill from below, balanced so neither side of the face dominates. No key-side shadow, no nose shadow, no under-brow or under-chin shadow, no cheek or jaw shadow falloff, no rim light, no backlight, no ambient bounce, no colour cast, no coloured gel, no hot spot on the forehead, nose, cheeks, chin or lips. Neutral white balance. The skin reads matte with zero specular shine. The light is flat, neutral and free of baked-in shadows or reflections, so the plate can be relit and composited in post. Every feature of the face fully and evenly legible.
```

### Background [LOCKED]

```
Background: plain flat mid-grey seamless, uniform, no gradient, no texture, no environment.
```

### Lens [LOCKED]

```
Lens: 85mm portrait lens, medium aperture, the whole face and hair in sharp focus, background clean.
```

### Skin [LOCKED]（毛孔级 + 哑光）

```
Skin: pore-level photographic realism — [pale/fair/light tan/olive/...], fine and even, natural subsurface skin tone, matte finish, no oily sheen, no waxy or sweaty highlights, no specular hotspots, no glare on the face, individual hairs resolved. Symmetric features. No moles, no freckles, no scars, no blemishes, no makeup, no marks of any kind.
```

### Technical [LOCKED]

```
Technical: fine 35mm film grain, no digital sharpening, no beauty retouching, no skin smoothing, no HDR, no glow. No text, no watermark, no logo, no border.
```

### Common Negatives（所有媒介通用，接在 Negative 开头）

```
no painting, no illustration, no stylisation, no 3D, no CGI, no render, no cartoon proportions, no enlarged eyes, no smoothed plastic skin, no oily skin, no shiny skin, no sweat, no wet skin, no face glare, no blown-out highlights on the face, no glossy lips, no dramatic lighting, no hard shadows, no cast shadows, no colour cast, no coloured ambient light, no rim light, no backlight, no beauty filter, no airbrushing
```

照片输入时删掉其中与"否定照片"冲突的短语（如 no painting 等可保留为防御性约束，无冲突；`no dramatic lighting` 等全部保留）。

---

## 四、身份词库

按观察选用，不覆盖不到的特征不写。

### 年龄 / 身形 / 肩颈

- 年龄：`young child` / `boy` / `girl` / `teenage boy` / `young man` / `young woman` / `middle-aged man` / `elderly man`
- 整体 build：`slight` / `slender` / `lean` / `average build` / `stocky` / `heavyset`
- 肩：`narrow-shouldered` / `sloping shoulders` / `square shoulders` / `broad-shouldered`
- 颈：`thin neck` / `slight neck` / `average neck` / `thick neck` / `long neck`

### 肤色

`pale indoor complexion` / `fair skin` / `light skin` / `light tan` / `warm olive skin` / `medium brown skin` / `deep brown skin` / `dark skin`；需要时加冷暖：`cool undertones` / `warm undertones`。

### 脸型 / 颊 / 颌 / 下巴

- 脸型：`round face` / `oval face` / `long narrow face` / `square face` / `heart-shaped face` / `wide face`
- 颊：`soft round cheeks` / `full cheeks` / `slightly hollow cheeks` / `high cheekbones` / `flat cheekbones`
- 颌：`smooth unformed jaw` / `soft jawline` / `defined jawline` / `sharp angular jaw` / `square jaw`
- 下巴：`small chin` / `pointed chin` / `rounded chin` / `broad chin` / `slightly receding chin` / `cleft chin`

### 眼 / 眉

- 眼型：`large round eyes` / `almond eyes` / `narrow eyes` / `deep-set eyes` / `hooded eyes` / `wide-set eyes` / `close-set eyes` / `slightly upturned eyes` / `downturned eyes`
- 眼色：`dark eyes` / `brown eyes` / `hazel eyes` / `green eyes` / `blue eyes` / `grey eyes`
- 附加：`single eyelids` / `double eyelids` / `long lashes` / `sparse lashes`
- 眉：`thick straight brows` / `thin arched brows` / `soft natural brows` / `bushy brows` / `pale sparse brows`

### 鼻

`straight nose` / `high nose bridge` / `low nose bridge` / `aquiline nose` / `small button nose` / `wide nose` / `narrow nose` / `rounded nose tip` / `broad nostrils` / `slightly upturned nose`

### 嘴 / 唇

`thin lips` / `full lips` / `medium lips` / `wide mouth` / `small mouth` / `straight mouth` / `defined cupid's bow` / `slightly downturned corners`

### 头发

- 色：`black` / `dark brown` / `brown` / `auburn` / `blonde` / `dark blonde` / `grey` / `greying` / `white`
- 质：`straight` / `wavy` / `curly` / `coarse` / `fine` / `thick` / `thin`
- 发流/发型：`falling over the forehead` / `side-swept fringe` / `centre-parted` / `slicked back` / `short crop` / `tousled` / `shoulder-length` / `tied back`
- 发际线：`low hairline` / `high hairline` / `receding hairline` / `widow's peak` / `even hairline`
- 胡须：`clean-shaven, no facial hair` / `light stubble` / `short beard` / `full beard` / `thin moustache`

### 表情（锁定，不随图）

`neutral closed expression — mouth relaxed, not smiling, not frowning, eyes open and level, looking directly into the lens.`

### 服装（默认）

`the collar of a plain light grey crew-neck sweatshirt just visible at the bottom of frame. Nothing else in the frame.`
可替换：`plain white t-shirt` / `plain dark crew-neck top`；保持素色、无领饰、无花纹、无 Logo。

---

## 五、Golden Sample（质量基准）

用户提供的范例，为措辞密度、节奏与标准的基准线（painted 媒介、男孩）：

```
Photorealistic head-and-shoulders portrait. Neutral character reference plate, straight to camera, eye level. Photographed, not rendered — a real photograph of a real face.<<<REF>>> is a painted character design. Use it for identity only: the structure and proportions of the face, the shape of the head, the set and spacing of the eyes, the shape of the nose and chin, the hairline and the way the hair falls, the build of the neck and shoulders. Do not inherit its medium, its brushwork, its texture, its palette, its lighting or its background. Translate this exact person from an oil painting into a photograph, with natural photographic proportions.Identity: Slight, narrow-shouldered Russian boy with a pale indoor complexion, straight dark hair falling over his forehead, and large dark eyes. Soft round cheeks, small chin, smooth unformed jaw, smooth skin with no facial hair. Neutral closed expression — mouth relaxed, not smiling, not frowning, eyes open and level, looking directly into the lens. Wet living eyes with natural catch-lights. The collar of a plain light grey sweatshirt just visible at the bottom of frame. Nothing else in the frame.

Lighting: soft, even, shadowless reference light — one large diffused source from directly front-above, gentle fill from below, no key-side shadow, no rim, no backlight, no colour cast. Neutral white balance. Every feature of the face fully and evenly legible.

Background: plain flat mid-grey seamless, uniform, no gradient, no texture, no environment.

Lens: 85mm portrait lens, medium aperture, the whole face and hair in sharp focus, background clean.

Skin: pore-level photographic realism — pale, fine and even, natural subsurface skin tone, individual hairs resolved. Symmetric features. No moles, no freckles, no scars, no blemishes, no marks of any kind.

Technical: fine 35mm film grain, no digital sharpening, no beauty retouching, no HDR, no glow. No text, no watermark, no logo, no border.

Negative: no painting, no oil paint, no brushstrokes, no brush texture, no impasto, no canvas texture, no painterly skin, no visible strokes in the hair, no illustration, no stylisation, no cartoon proportions, no enlarged eyes, no 3D, no CGI, no render, no smoothed plastic skin. Not an artwork of the boy. A photograph of the boy.
```

注意：本 Skill 在 Golden Sample 基础上**强制升级**了 Lighting / Skin / Negative 三处（哑光、零油光、后期友好光源），实际产出以第三节锁定段为准，Golden Sample 仅用于对齐身份描述密度与整体节奏。

---

## 六、交付前自检清单

逐句核对，全部通过才可输出：

1. 11 段齐全且顺序正确：Opening → Reference → Identity → Expression → Eyes → Wardrobe → Lighting → Background → Lens → Skin → Technical → Negative。
2. 开头含 "Photographed, not rendered — a real photograph of a real face."。
3. 媒介判定正确，Reference 隔离段与 Negative 否定词与该媒介匹配；photo 输入时无"否定照片"的错误断言。
4. Identity 中每个特征均能在参考图中指出依据；脸型、眼型、鼻、唇、下巴、发际线、发流、肩颈至少覆盖 8 项；图中不可见的项用中性词，未编造。
5. 表情为中性闭合、直视镜头、眼平；未继承原图笑容/怒容/侧脸。
6. Lighting 段完整：无影、无色偏、无轮廓光/背光、无方向性阴影、皮肤零镜面高光、声明可后期重打光。
7. Skin 段含 matte / no oily sheen / no specular hotspots；无痣、斑、疤、妆。
8. 眼神光仅 small neutral catch-lights；无面部过曝白斑、无油亮唇。
9. 背景为 flat mid-grey seamless；服装为素色圆领、仅领口入镜。
10. 85mm、35mm film grain、无 sharpening/HDR/glow、无 text/watermark/logo/border。
11. 全英文、段标签英文、无中文残留；单段连续成块，风格与 Golden Sample 一致。
