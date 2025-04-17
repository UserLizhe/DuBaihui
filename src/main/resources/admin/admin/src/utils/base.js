const base = {
    get() {
        return {
            url : "http://localhost:8080/zixishiguanli/",
            name: "zixishiguanli",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/zixishiguanli/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "百百自习室管理系统 "
        } 
    }
}
export default base
