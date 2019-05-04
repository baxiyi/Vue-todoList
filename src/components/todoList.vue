<template>
    <div id="todolist">
        <inputText
                v-model="searchText"
                placeholder="search..."
                @keydown.enter="addTodo"
        ></inputText>
        <newButton id="new"
                   @click.native="isNew=true"
        ></newButton>
        <ul v-if="todos.length">
            <listItem
                    v-for="todo in showTodos"
                    :key="todo.id"
                    :todo="todo"
                    @remove="removeTodo"
            ></listItem>
        </ul>
        <newWindow :is-show="isNew"
                    v-model="newTodoText"
                   :value="newTodoText"
                   @success-close="addTodo"
                   @fail-close="isNew=false"
        ></newWindow>
    </div>

</template>

<script>
    import inputText from './inputText.vue'
    import listItem from './listItem.vue'
    import newButton from './newButton.vue'
    import newWindow from './newWindow.vue'
    export default {
        name: "list.vue",
        components:{
            inputText,listItem,newButton,newWindow
        },
        created:function(){
            let storage=window.localStorage;
            if(storage.todos!="undefined"){
                this.todos=Array.from(Object.values(JSON.parse(storage.todos)));
                //console.log(this.todos);
            }
        },
        watch:{
            todos:function () {
                let storage=window.localStorage;
                let data=JSON.stringify({...this.todos});
                storage.setItem("todos",data);
            }
        },
        data(){
            return {
                newTodoText:'',
                searchText:'',
                todos:[],
                isNew:false
            }
        },
        computed:{
            showTodos(){
                if(this.todos.length){
                    return this.todos.filter((item)=>{
                        return item.text.indexOf(this.searchText)!==-1;
                    })
                }
                else{
                    return [];
                }

            }
        },
        methods:{
            addTodo(){
                //console.log(this.newTodoText);
                const text=this.newTodoText.trim();
                if(text){
                    let idSet=new Set();
                    for(let i in this.todos)
                        idSet.add(this.todos[i].id);
                    let nextId=1;
                    while(idSet.has(nextId))
                        nextId++;
                    this.todos.push({
                        id:nextId,
                        text:text
                    })
                    this.newTodoText='';
                }
                this.isNew=false;
            },
            removeTodo(id){
                this.todos=this.todos.filter(todo=>{
                    return todo.id!==id
                })
            }
        }
    }
</script>

<style scoped>
#new{
    margin-left:10px;
}
</style>