# 角色资产写实摄影提示词技能包（Doubao Skills）

三个可独立、可协同工作的 Doubao 技能：把任意媒介（动漫 / 漫画 / 油画 / 水彩 / 3D / CG / 真人照片 / 手办雕塑）的人物素材，转译成**写实摄影级、可直接复制投喂图像模型的英文提示词**。

## 技能清单

| 技能 | 输入 | 产物画幅 | 产物内容 |
|---|---|---|---|
| `photoreal-face-plate` | 一张含脸的人物图 | 方图（默认） | 85mm 中性人脸定妆照提示词（head-and-shoulders reference plate），毛孔级哑光皮肤、中性表情直视镜头 |
| `photoreal-garment-plate` | 一张含服装的人物图 | 9:16 竖版 | 无五官白色哑光塑料假人全身穿着的服装照提示词，真实面料、真实裁缝、可制作 |
| `character-asset-sheet` | 头像图 + 服装图（也可一张图兼任） | 3:2 横版 | 三栏人物资产表：左 1/3 正面大头照、中 1/3 无头全身正面、右 1/3 无头全身背面 |

## 一键安装（只需一条命令）

### Windows（PowerShell）

```powershell
irm https://raw.githubusercontent.com/zh13293895107-creator/doubao-character-asset-skills/main/install.ps1 | iex
```

脚本会自动定位 Doubao 的 `.user_skills` 目录，下载并安装全部三个技能；已存在的同名技能默认跳过，升级时加 `-Force`（自动备份旧版为 `.bak.时间戳`）：

```powershell
# 升级（覆盖并自动备份）
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/zh13293895107-creator/doubao-character-asset-skills/main/install.ps1))) -Force

# 自定义安装目录
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/zh13293895107-creator/doubao-character-asset-skills/main/install.ps1))) -TargetDir "D:\my-skills"
```

### macOS / Linux（bash）

```bash
curl -fsSL https://raw.githubusercontent.com/zh13293895107-creator/doubao-character-asset-skills/main/install.sh | bash
```

安装完成后**重启或新开一个 Doubao 会话**，技能即被识别。

### 手动安装

1. 下载本仓库 ZIP：`https://github.com/zh13293895107-creator/doubao-character-asset-skills/archive/refs/heads/main.zip`
2. 解压后把 `skills/` 下的三个文件夹复制到 Doubao 用户技能目录：
   - Windows：`%USERPROFILE%\AppData\Local\Doubao\User Data\Default\.doubao\agent_mode\workspace\.user_skills\`
   - macOS：`~/Library/Application Support/Doubao/User Data/Default/.doubao/agent_mode/workspace/.user_skills/`（或 `~/.doubao/agent_mode/workspace/.user_skills/`）
3. 重启会话。

## 单独使用

- **只要一张脸的写实参考板**：上传人物图，说“做人脸资产 / face plate / 转写实”。
- **只要一套衣服的真实成衣设计**：上传角色图，说“做服装资产 / garment plate / 衣服转写实”。
- **要完整角色资产表**：上传角色图（含脸和全身），说“做角色资产表 / 三视图 / turnaround”。

## 协同工作（推荐流程）

```
人脸素材（任意媒介）──► photoreal-face-plate ──► 人脸提示词（可先单独出图确认脸）
                                                        │
                                                        ├─► character-asset-sheet ─► 3:2 资产表提示词
服装素材（任意媒介）──► photoreal-garment-plate ─► 服装提示词（可先单独出图确认衣服）─┘
```

- **头像和服装是两张图**：把两张图都传给 `character-asset-sheet`，分别用 `<<<FACE>>>`（只取脸）和 `<<<GARMENT>>>`（只取衣服）标记，互不串味。
- **只有一张全身图**：两个标记自动指向同一张图。
- 三个技能共享同一套锁定标准与词库，`character-asset-sheet` 直接复用另外两个技能的面部规则、面料词库与奇幻转译表，产出的提示词与单独出图保持一致。
- 标准用法：先出人脸板、再出服装板，分别确认无误后，再合成三栏资产表，减少返工。

## 三个技能共同锁定的技术标准

1. **输出永远是照片**：`Photographed, not rendered`，Negative 穷举否定原图媒介（动漫/油画/3D/手办）。
2. **哑光皮肤、零油光**：no oily sheen / no specular hotspots / no face glare，仅保留小而中性的眼神光。
3. **后期友好光源**：均匀柔和无影、无色偏、无轮廓光、无投影、无环境反弹，平到可直接抠图重打光。
4. **固定镜头与质感**：85mm（人脸、资产表）/ 50mm（服装）、中灰无缝背景、35mm 细胶片颗粒、无磨皮锐化 HDR。
5. **真实材质、可制作**：服装具体到纤维与织法；浮空件、发光纹、铠甲等非现实元素按《奇幻转译规则》落地为真实裁缝结构。
6. **只给提示词**：技能默认只产出英文提示词；用户明确说“出图”后才调用图像生成。

## 目录结构

```
doubao-character-asset-skills/
├── README.md                      # 本文件
├── install.ps1                    # Windows 一键安装脚本
├── install.sh                     # macOS / Linux 一键安装脚本
└── skills/
    ├── photoreal-face-plate/
    │   ├── SKILL.md
    │   └── references/prompt-template.md
    ├── photoreal-garment-plate/
    │   ├── SKILL.md
    │   └── references/garment-template.md
    └── character-asset-sheet/
        ├── SKILL.md
        └── references/sheet-template.md
```

## 升级与卸载

- 升级：重跑安装命令并加 `-Force`（Windows）或直接重跑 bash 脚本（自动备份旧版）。
- 卸载：删除 `.user_skills/` 下对应的三个技能文件夹即可。

## 许可

内部团队技能包，按需自由使用与修改。
