<template>
    <div>
        <inputText
                v-model="newTodoText"
                placeholder="Add new todo"
                @keydown.enter="addTodo"
        ></inputText>
        <ul v-if="todos.length">
            <listItem
                    v-for="todo in todos"
                    :key="todo.id"
                    :todo="todo"
                    @remove="removeTodo"
            ></listItem>
        </ul>
    </div>

</template>

<script>
    import inputText from './inputText.vue'
    import listItem from './listItem.vue'
    export default {
        name: "list.vue",
        components:{
            inputText,listItem
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
                todos:[]
            }
        },
        methods:{
            addTodo(){
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

</style>