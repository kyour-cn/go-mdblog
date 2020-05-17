package model

/**
 * 站点配置分类
 */
type SettingClass struct {
	Id    uint `gorm:"type:int(11);PRIMARY_KEY"`
	Name  string
	Title string
}

//定义数据库表名
func (SettingClass) TableName() string {
	return "setting_class"
}
