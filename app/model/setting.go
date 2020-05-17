package model

import (
	"github.com/kyour-cn/gourd/server/db"
)

/**
 * 站点配置相关数据
 */
type Setting struct {
	Id    uint   `gorm:"type:int(11);PRIMARY_KEY"`
	Name  string `gorm:"type:varchar(255);"` // 给address字段创建名为addr的索引
	Tag   string `gorm:"type:char(24);"`
	Value string `gorm:"type:text;"`
	Type  string `gorm:"type:char(24);"`
	Class uint8  `gorm:"type:int(8);"`
}

//定义数据库表名
func (Setting) TableName() string {
	return "setting"
}

//获取分类下所有数据
func (m Setting) GetClass(v interface{}, where []string) (list []Setting) {

	conn := db.Conn()

	//查询条件
	for _, v := range where {
		conn.Where(v)
	}

	switch v.(type) {
	case int:
		conn.Where("class = ?", v)

	case string:

		conn.Table(m.TableName()).
			Select("setting.*").
			Joins("left join setting_class on setting_class.id = setting.class").
			Where("setting_class.name = ?", v).
			Find(&list)

		return

	}

	return

}

//获取常用的站点配置
func (m Setting) GetSite() map[string]interface{} {

	data := make(map[string]interface{})

	list := m.GetClass("site", []string{})

	//添加数据
	for _, v := range list {
		data[v.Tag] = v.Value
	}

	return data

}
