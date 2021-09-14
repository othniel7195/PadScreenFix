# PadScreenFix

## Pad 不同分辨率屏幕适配

### 支持数据类型

- Int
- CGFloat
- Float
- Double

### 默认匹配规则

- 默认横屏匹配
- 默认ui设计稿分辨率  1920 * 1080
- 默认基于width 比率适配

### 自定义对比UI模板分辨率 

`PadScreenFitConfig.uiTemplate = .custom(width: 1920, height: 1080)`

### 自定义横竖屏

`PadScreenFitConfig.isLandscape = true or false`

### 自定义匹配规则

> /// 设置适配规则
>
>   /// - Parameters:
>
>   ///  - uiScreen: UI设计师设计用的分辨率
>
>   ///  - ratio: 适配比率 nil 就用默认比率
>
>   ///  - numberLines: 默认换行
>
>   ///  - matchState: 适配机制 默认基于width 比率适配

`let rule = PadFitRule(PadScreenFitConfig.uiTemplate)`

`PadFitManger.setRules(fontRule:..., inchRule:...)`

### 基于整体性的匹配规则的用法

###### 字体适配

`UIFont.systemFont(ofSize: 10.fitFont)`

###### 布局适配

`100.fitInch` 基于选择的 比率适配, 默认基于width比率

`100.fitWRatio,100.fitHRatio` 当选择 width和height基于各自比率适配时调用方法

当类似CGSize这种需要传入CGFloat类型时  调用 `100.fitInch()` 

### 基于单个UI定制化的匹配规则

###### 例子：

`10.p97(value: 12).p129(value: 14)` 

10表示 ui设计稿的分辨率的大小， 12 是9.7寸屏的大小，14是12.9寸屏大小，以此类推

### 支持适配屏幕尺寸

- p97（9.7寸）
- p102（10.2寸）
- p105 (10.5寸)
- p11 （11寸）
- p129 （12.9寸）

### 支持的适配比率

- wRatio (基于width 比率适配)
- hRatio (基于height 比率适配)
- minRatio (基于width, height 中最小比率适配)
- maxRatio (基于width, height 中最大比率适配)
- fullRatio (width, height 基于各自的比率适配)

