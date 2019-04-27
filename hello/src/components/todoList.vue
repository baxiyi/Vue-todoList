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
    let nextTodoId=1;
    export default {
        name: "list.vue",
        components:{
            inputText,listItem
        },
        data(){
            return {
                newTodoText:'',
                todos:[
                    {
                        id:nextTodoId++,
                        text:'Learn Vue'
                    },
                    {
                        id:nextTodoId++,
                        text:'Learn Node.js'
                    },
                    {
                        id:nextTodoId++,
                        text:'Find a girlfriend'
                    }
                ]
            }
        },
        methods:{
            addTodo(){
                const text=this.newTodoText.trim();
                if(text){
                    this.todos.push({
                        id:nextTodoId++,
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