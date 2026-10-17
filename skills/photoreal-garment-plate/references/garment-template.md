# 写实服装资产提示词模板（英文产物）

组装规则：严格按 14 段顺序；`[方括号]` 为按观察替换的占位符；标注 **[LOCKED]** 的段落原样保留；Reference 段与 Negative 中的媒介否定按判定类型切换。

## 目录

- [一、完整模板](#一完整模板)
- [二、媒介适配段](#二媒介适配段)
- [三、锁定段标准措辞](#三锁定段标准措辞)
- [四、服装词库](#四服装词库)
- [五、奇幻转译规则](#五奇幻转译规则)
- [六、Golden Sample（质量基准）](#六golden-sample质量基准)
- [七、交付前自检清单](#七交付前自检清单)

---

## 一、完整模板

```
Photorealistic full-length garment photograph, vertical 9:16 composition. Neutral clothing reference plate, front view, eye level, professional e-commerce product photography. Photographed, not rendered — a real photograph of a real garment on a real mannequin.

Mannequin: a full-body, head-to-toe [male / female / androgynous] dress-form mannequin in smooth matte white plastic, standing upright and facing the camera in a neutral A-pose, arms slightly away from the torso so the sleeves and sides of the garment are fully visible, feet together. The head is a smooth blank egg-shaped white form with no face — no eyes, no nose, no mouth, no ears — no hair, no skin, no expression. [barefoot featureless white plastic feet / simple footwear per the design]. No jewellery, no props.

<<<REF>>> is [MEDIA DECLARATION]. Use it for the garment design only: the silhouette, cut, construction, proportions and lengths, the collar, shoulders and sleeves, the fastenings, seams and structural details, the layering, the colour placement, the pattern and the implied fabric. Do not inherit [MEDIA STRIP LIST]. Translate this costume into a real, wearable, physically plausible garment made of real fabrics with real tailoring, and dress it on the mannequin.

Garment: [OUTER LAYER — 品类, 廓形, 长度, 领, 肩袖, 门襟, 关键结构]. [MID LAYER — …]. [INNER LAYER — …]. [BOTTOM — …]. [DRESS / JUMPSUIT — …]. [ACCESSORIES — hat / belt / gloves / scarf / cape / legwear …]. [FOOTWEAR — …].

Material: [逐件：纤维 + 织法 + 厚薄 + 挺括度 + 光泽]. Real textile photography — visible weave and grain, natural fabric weight, correct drape, real stitching, real buttons and zippers, matte cloth surfaces unless the garment genuinely calls for sheen.

Colour & Pattern: [逐件主色/辅色与分区]. [图案与真实实现方式：woven jacquard / embroidery / screen print / appliqué / beading / patchwork …].

Construction: [省道、褶裥、抽褶、衬里、垫肩、口袋、开衩、 vents、罗纹、缝线、绗缝、金属件……].

Fit & Drape: [合身状态 on the dress form], natural gravity-driven folds and resting creases, fabric falls naturally from the shoulders and waist, hem resting naturally; no wind, no blown fabric, no floating parts.

Framing: [LOCKED — 见三]

Lighting: [LOCKED — 见三]

Background: [LOCKED — 见三]

Lens: [LOCKED — 见三]

Mannequin surface: [LOCKED — 见三]

Technical: [LOCKED — 见三]

Negative: [COMMON NEGATIVES] + [MEDIA NEGATIVES]. Not an illustration of the outfit. A photograph of the outfit.
```

要点：

- Garment 段由外到内、由上到下逐件写，每件一个完整名词短语；件与件之间用句号断开。
- 面料、颜色、图案若已在 Garment 中点名，仍要在 Material / Colour & Pattern 段展开到纤维与工艺级别。
- `<<<REF>>>` 为参考图占位；平台不支持时改 "the reference image"。
- 单套服装 1 段提示词；套装拆开卖或需要背面/侧面时，另出独立提示词。

---

## 二、媒介适配段

### 1. illustrated（动漫/漫画/赛璐璐/立绘/插画）

- MEDIA DECLARATION：`a 2D anime-style illustration of a character wearing clothes`
- MEDIA STRIP LIST：`the character's face, body, pose, skin, hair, the line art, cel shading, flat colour fills, stylised proportions, palette grading, lighting, special effects or background`
- MEDIA NEGATIVES：`no illustration, no anime, no manga, no cartoon, no cel shading, no line art, no ink outlines, no flat colour fills, no sticker-like shading, no stylised proportions, no printed-on shading`

### 2. painted（油画/水彩/古典肖像/工笔）

- MEDIA DECLARATION：`a painted portrait of a clothed figure`（已知画种改 `an oil painting` / `a watercolour`）
- MEDIA STRIP LIST：`the figure's face, body and pose, the brushwork, impasto, canvas texture, painterly shading, palette, painted lighting or background`
- MEDIA NEGATIVES：`no painting, no oil paint, no watercolour, no brushstrokes, no brush texture, no impasto, no canvas texture, no painterly fabric, no fine-art portrait, no visible strokes`

### 3. rendered（3D/游戏引擎/虚拟人/手办渲染）

- MEDIA DECLARATION：`a 3D rendered character wearing clothes`
- MEDIA STRIP LIST：`the character's face, body and pose, the CG shaders, plastic skin, render artefacts, stylised topology, engine lighting, particle effects or background`
- MEDIA NEGATIVES：`no 3D, no CGI, no CG, no render, no game engine look, no unreal-engine look, no shader fabric, no plastic cloth, no virtual material, no ray-traced artefacts`

### 4. photo（真人照片/剧照/cosplay/秀场/电商）

- MEDIA DECLARATION：`a photograph of a person wearing clothes`
- MEDIA STRIP LIST：`the person's face, body, identity, pose, makeup, hair, the location, colour grade, lighting, shadows and background`
- Reference 末句改为：`Re-shoot this exact outfit as a garment photographed on the white mannequin, with real fabrics and natural proportions.`
- 不需要媒介否定，保留全部通用否定；结尾断言句删除。
- 补充：`no beauty retouching, no candid snapshot`。

### 5. sculpted（手办/BJD/雕塑/玩偶实物）

- MEDIA DECLARATION：`a sculpted figurine wearing painted clothes`
- MEDIA STRIP LIST：`the figure's sculpted face and body, the clay or resin surface, painted-on clothing, mould seams, joints, stylisation, lighting and background`
- Reference 末句改为：`Translate this costume off the sculpted figure into a real garment made of real fabrics, and dress it on the mannequin.`
- MEDIA NEGATIVES：`no sculpture, no statue, no figurine, no resin kit, no BJD, no doll, no toy, no action figure, no clay, no painted-on clothes, no mould seams, no joints`

---

## 三、锁定段标准措辞

### Framing [LOCKED]（9:16 全身）

```
Framing: vertical 9:16 full-length shot, the entire mannequin and every layer of the outfit visible from the top of the head form to the feet, centred, even headroom and floor margin, no cropping of the collar, shoulders, cuffs, fingertips or hem, straight front view.
```

### Lighting [LOCKED]（后期友好，无影无色偏）

```
Lighting: soft, even, shadowless catalogue light — large diffused sources from front-left and front-right at equal power, gentle fill from directly in front, no key-side shadow, no cast shadow on the seamless backdrop, no hard shadow under the chin or hem, no rim light, no backlight, no coloured gel, no ambient bounce, no colour cast. Neutral white balance. The white plastic reads clean matte white with no specular hotspots; fabrics are lit to reveal weave, texture and stitching. Flat, neutral, baked-in-free lighting, ready for cut-out, compositing and relighting in post.
```

### Background [LOCKED]

```
Background: plain flat light-mid grey seamless cyclorama, uniform, no horizon line, no gradient, no texture, no floor reflection, no environment, no set.
```

### Lens [LOCKED]

```
Lens: 50mm standard lens on a level camera, zero tilt, no wide-angle distortion, no perspective stretch, medium aperture, the entire garment from collar to hem in sharp focus, fabric texture crisp, background clean.
```

### Mannequin Surface [LOCKED]（哑光白塑料）

```
Mannequin surface: matte white fibreglass-reinforced plastic, no gloss, no room reflections, no fingerprints, no visible articulated joints, no stand hardware in frame, only a faint factory mould line allowed.
```

### Technical [LOCKED]

```
Technical: fine 35mm film grain, no digital sharpening, no HDR, no glow, no fashion retouching. No text, no watermark, no logo, no brand label, no border.
```

### Common Negatives（通用，接在 Negative 开头）

```
no human, no person, no real fashion model, no living body, no skin, no face, no eyes, no nose, no mouth, no ears, no hair, no facial features, no doll with a face, no action figure, no toy, no robot, no statue, no articulated joints, no ghost mannequin, no hanger, no flat lay, no garments on the floor, no plastic-looking fabric, no rubbery cloth, no painted-on patterns, no glowing lines, no light effects, no magic effects, no floating fabric, no wind, no floating collars, no unsupported parts, no gravity-defying folds, no jewellery, no props, no furniture, no scene, no text, no watermark, no logo, no border
```

---

## 四、服装词库

### 品类（按层）

- 外套：`trench coat / overcoat / pea coat / duffle coat / parka / puffer jacket / bomber jacket / biker jacket / denim jacket / blazer / tailcoat / cape / cloak / poncho / haori / surcoat / gambeson coat`
- 上衣：`t-shirt / shirt / blouse / sweatshirt / hoodie / sweater / turtleneck / tank top / polo / button-up shirt / tunic / doublet / waistcoat / vest / bodice / corset top / crop top / jacket top`
- 下装：`jeans / trousers / chinos / cargo pants / sweatpants / tailored trousers / breeches / shorts / skirt (pencil/A-line/pleated/wrap/maxi) / hakama / sarong`
- 连体：`dress / shirt dress / qipao / gown / robe / jumpsuit / coveralls / bodysuit / leotard`
- 内搭：`undershirt / camisole / lining layer / petticoat / crinoline / tights / leggings / stockings / socks`
- 配饰：`hat / cap / beret / hood / scarf / shawl / tie / bow tie / gloves / fingerless gloves / belt / sash / suspenders / apron / epaulettes / arm guards / bracers / greaves / pouch / bag`
- 鞋：`leather boots / ankle boots / knee-high boots / lace-up shoes / oxfords / loafers / sneakers / sandals / sabatons / bare feet`
- 板型：`male dress form` / `female dress form` / `androgynous dress form`

### 廓形 / 长度

- 廓形：`fitted / tailored / slim / regular / relaxed / oversized / boxy / baggy / A-line / flared / draped / cocoon / trapeze / empire-waist / cinched-waist`
- 上衣长：`cropped / waist-length / hip-length / thigh-length / knee-length / calf-length / ankle-length / floor-length`
- 袖长：`sleeveless / cap sleeve / short sleeve / elbow sleeve / three-quarter sleeve / long sleeve / extra-long sleeve`
- 腰线：`high waist / natural waist / low waist / dropped waist`

### 领 / 肩袖 / 门襟

- 领：`crew neck / V-neck / U-neck / turtleneck / mock neck / henley / polo collar / shirt collar / camp collar / notch lapel / peak lapel / shawl lapel / mandarin collar / stand collar / sailor collar / hood / off-shoulder / square neckline / sweetheart neckline`
- 肩袖：`set-in sleeve / raglan sleeve / dolman sleeve / dropped shoulder / puff sleeve / bishop sleeve / bell sleeve / cape sleeve / sleeveless` / `padded shoulders / shoulder wings / epaulettes / shoulder armour`
- 门襟：`pullover / full zip / half zip / button-up / single-breasted / double-breasted / snaps / hook-and-eye / laced front / wrap front / buckle straps`

### 面料（纤维 / 织法 / 质感）

- 棉麻：`cotton jersey / cotton canvas / cotton twill / oxford cloth / chambray / denim / linen / linen-cotton blend / corduroy / fleece / french terry / sweatshirt fleece`
- 毛呢：`wool melton / wool tweed / herringbone wool / flannel / bouclé / knit wool / merino knit / cashmere / felt`
- 丝滑：`silk / satin / silk charmeuse / chiffon / organza / georgette / taffeta / velvet / brocade / damask / lace`
- 针织：`rib knit / cable knit / fine gauge knit / chunky knit / heather jersey`
- 机能/化纤：`nylon ripstop / polyester taffeta / gore-tex shell / softshell / quilted shell / neoprene / mesh / tulle`
- 皮革甲胄：`full-grain cowhide / vegetable-tanned leather / suede / nubuck / lambskin / patent leather / leather armour / steel or brass plates / riveted mail / chainmail / quilted gambeson padding`
- 其他：`rubberised cloth / oilcloth / sequin fabric / embroidered silk / hand-printed cotton / tie-dye / washed and faded fabric`
- 光泽词：`matte / low sheen / satin sheen / glossy (仅皮衣/缎面/漆皮使用)`

### 颜色

`ivory / off-white / cream / light grey / charcoal / black / navy / royal blue / powder blue / burgundy / wine red / crimson / rust / olive drab / khaki / camel / tan / brown / forest green / emerald / mustard / gold / champagne / silver / lavender / purple`；需要时加 `heather / faded / muted / deep / bright`。

### 图案 / 工艺 / 做旧

- 图案：`solid / heather / striped / pinstripe / plaid / tartan / argyle / houndstooth / floral / botanical / camouflage / geometric / colour-blocked / graphic print`
- 真实实现：`woven jacquard / embroidery / thread-work / gold-thread embroidery / screen print / block print / appliqué / patchwork / beading / studding / riveting / laser engraving / embossed leather / tooled leather / tie-dye / dip-dye / quilting`
- 做旧：`new / stone-washed / faded / worn-in / distressed / frayed edges / raw hem (overlocked) / weathered / sun-bleached / polished leather / aged metal hardware`

### 结构细节词

`darts / pleats / gathers / ruffles / peplum / yoke / lining / interfacing / boning / shoulder pads / ribbed cuffs / ribbed hem / drawstring / belt / belt loops / waistband / pockets (patch / welt / jetted / cargo) / vents / slit / kick pleat / zipper (metal/exposed) / buttons (horn/brass/wrapped) / buckles / clasps / hook-and-eye / topstitching / flat-felled seams / bound seams / embroidery / piping / lapel facings`

---

## 五、奇幻转译规则

所有 illustrated / rendered / painted 中的非现实元素，按下表落地；表中无对应且无法物理实现的特效，直接删除，不保留。

| 原画元素 | 真实化转译 |
|---|---|
| 发光符文/能量纹/光路 | 删除光效，改为哑光刺绣、金属线绣、提花织纹或皮面压印 |
| 浮空翻领、悬空衣片、反重力飘带 | 加领衬/鱼骨衬/边缘细铁丝/重垂里料，固定于肩腰腕，静态自然垂落 |
| 金属胸甲、肩甲、铠甲 | 钢/铜甲片铆接或皮绳穿接在植鞣革底衣与绗缝衬垫上，保留搭接与重量 |
| 皮甲、绑带胸衣 | 厚植鞣革裁片 + 缝线 + 金属搭扣/气眼系带 |
| 锁子甲、板甲 | 真实 chainmail / 钢板甲叠在厚布衬垫 gambeson 外 |
| 薄纱透视装 | 真丝雪纺/欧根纱，标注层数与内衬打底件 |
| 夸张尖肩、几何肩甲 | 垫肩、硬质衬、肩章或轻型甲片实现，外覆同面料 |
| 大翻领/高立领立不住 | 驳头衬、领衬与暗扣固定，写出固定方式 |
| 敞开却无开合的衣片 | 补真实拉链/纽扣/暗扣/系带/腰带，位置符合结构 |
| 魔法变色、荧光渐变 | 真实吊染、渐染、色织渐变或哑光烫印 |
| 宝石、水晶、珠饰 | 树脂/玻璃/金属底座镶嵌，缝或铆在衣片上 |
| 超长拖地、破碎下摆 | 保留长度，落地自然堆叠；毛边改真实锁边、流苏或不规则剪裁 |
| 丝带、长飘带 | 真实长布片，固定点明确，自然垂坠 |
| 巨大蝴蝶结、装饰花 | 真实面料手工打褶成型，背面固定 |
| 武器、宠兽、光效、非服装道具 | 不属于服装，一律不出现 |
| 魔术贴、塑料感拉链 | 改金属拉链、铜扣、真皮带扣 |

---

## 六、Golden Sample（质量基准）

illustrated 媒介，男性黑色长风衣套装（示范多层、甲胄之外的常规复杂套装）：

```
Photorealistic full-length garment photograph, vertical 9:16 composition. Neutral clothing reference plate, front view, eye level, professional e-commerce product photography. Photographed, not rendered — a real photograph of a real garment on a real mannequin.

Mannequin: a full-body, head-to-toe male dress-form mannequin in smooth matte white plastic, standing upright and facing the camera in a neutral A-pose, arms slightly away from the torso so the sleeves and sides of the garment are fully visible, feet together. The head is a smooth blank egg-shaped white form with no face — no eyes, no nose, no mouth, no ears — no hair, no skin, no expression. Black leather boots as part of the design. No jewellery, no props.

<<<REF>>> is a 2D anime-style illustration of a character wearing clothes. Use it for the garment design only: the silhouette, cut, construction, proportions and lengths, the collar, shoulders and sleeves, the fastenings, seams and structural details, the layering, the colour placement, the pattern and the implied fabric. Do not inherit the character's face, body, pose, skin, hair, the line art, cel shading, flat colour fills, stylised proportions, palette grading, lighting, special effects or background. Translate this costume into a real, wearable, physically plausible garment made of real fabrics with real tailoring, and dress it on the mannequin.

Garment: an oversized double-breasted long trench coat reaching mid-calf, wide notched lapels over a tall stand collar, dropped shoulders with set-in long sleeves, shoulder epaulettes with small brass buttons, a storm flap across the right chest, a matching self-fabric belt with a brass buckle at the waist, slash welt pockets, a deep back vent and a buttoned cuff tab; the coat worn open over a fine-gauge charcoal turtleneck sweater with long ribbed cuffs; straight-leg black tailored trousers with a natural waist and pressed creases; plain black lace-up leather boots to the ankle.

Material: coat in heavy matte cotton gabardine twill with a visible tight diagonal weave and a firm drape, lined in smooth dark viscose; sweater in fine merino wool rib knit with a soft matte nap; trousers in medium-weight wool-blend suiting, matte and crisp; boots in full-grain black cowhide with a low polished shine, rubber soles, cotton laces. Real textile photography — visible weave and grain, natural fabric weight, correct drape, real stitching, real buttons, zippers and eyelets, matte cloth surfaces except the subtle leather sheen.

Colour & Pattern: coat solid black with dark brass hardware; sweater solid charcoal; trousers solid black; boots black; all fabrics solid and unpatterned.

Construction: double-breasted front with two columns of brass buttons, horn-button closure, topstitched lapels and storm flap, chest and waist darts, belt loops, bound-seam lining, ribbed sweater cuffs and collar, pressed front creases on the trousers, welt pockets with clean bagging, reinforced boot eyelets, real topstitching throughout.

Fit & Drape: relaxed oversized coat squared at the shoulders and falling straight from the chest to the hem with natural resting folds at the elbows and behind the knees; fitted sweater; straight trousers breaking once at the boot; natural gravity-driven folds, hem resting naturally; no wind, no blown fabric, no floating parts.

Framing: vertical 9:16 full-length shot, the entire mannequin and every layer of the outfit visible from the top of the head form to the feet, centred, even headroom and floor margin, no cropping of the collar, shoulders, cuffs, fingertips or hem, straight front view.

Lighting: soft, even, shadowless catalogue light — large diffused sources from front-left and front-right at equal power, gentle fill from directly in front, no key-side shadow, no cast shadow on the seamless backdrop, no hard shadow under the chin or hem, no rim light, no backlight, no coloured gel, no ambient bounce, no colour cast. Neutral white balance. The white plastic reads clean matte white with no specular hotspots; fabrics are lit to reveal weave, texture and stitching. Flat, neutral, baked-in-free lighting, ready for cut-out, compositing and relighting in post.

Background: plain flat light-mid grey seamless cyclorama, uniform, no horizon line, no gradient, no texture, no floor reflection, no environment, no set.

Lens: 50mm standard lens on a level camera, zero tilt, no wide-angle distortion, no perspective stretch, medium aperture, the entire garment from collar to hem in sharp focus, fabric texture crisp, background clean.

Mannequin surface: matte white fibreglass-reinforced plastic, no gloss, no room reflections, no fingerprints, no visible articulated joints, no stand hardware in frame, only a faint factory mould line allowed.

Technical: fine 35mm film grain, no digital sharpening, no HDR, no glow, no fashion retouching. No text, no watermark, no logo, no brand label, no border.

Negative: no human, no person, no real fashion model, no living body, no skin, no face, no eyes, no nose, no mouth, no ears, no hair, no facial features, no doll with a face, no action figure, no toy, no robot, no statue, no articulated joints, no ghost mannequin, no hanger, no flat lay, no garments on the floor, no illustration, no anime, no manga, no cartoon, no cel shading, no line art, no ink outlines, no flat colour fills, no sticker-like shading, no stylised proportions, no printed-on shading, no plastic-looking fabric, no rubbery cloth, no painted-on patterns, no glowing lines, no light effects, no magic effects, no floating fabric, no wind, no floating collars, no unsupported parts, no gravity-defying folds, no jewellery, no props, no furniture, no scene, no text, no watermark, no logo, no border. Not an illustration of the outfit. A photograph of the outfit.
```

---

## 七、交付前自检清单

1. 14 段齐全且顺序正确；Opening 含 "Photographed, not rendered"。
2. 9:16：Framing 段写明 vertical 9:16 full-length；如调用生图，画幅参数同步设为 9:16。
3. 假人：白色哑光塑料、无五官、无发、无皮肤、无关节、A-pose、全身；无真人/玩具/衣架/平铺。
4. 媒介判定正确，Reference 隔离段与 Negative 否定词匹配；photo 输入无"否定照片"的错误断言。
5. 服装件数与层次完整，每件写清品类、廓形、长度、领、肩袖、门襟、关键细节。
6. 面料具体到纤维与织法（如 cotton gabardine twill），非 "nice fabric" 类空词；金属皮革标注真实工艺。
7. 颜色逐件落实，图案标注真实实现方式（提花/刺绣/印花/拼接）。
8. 所有非现实元素已按奇幻转译表落地或删除；开合、支撑、固定点真实存在。
9. 垂坠符合重力：无风、无飘起、无悬浮件；拖地件有自然堆叠。
10. Lighting 无影、无色偏、无投影、白塑料无镜面热点、声明可后期抠图重打光。
11. 浅灰无缝背景、无环境、无道具、无文字水印；配饰鞋履只保留设计内的。
12. 50mm 水平机位、无畸变、全身锐利；全英文、无中文残留，风格与 Golden Sample 一致。
