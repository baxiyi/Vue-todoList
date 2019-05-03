<template>
    <li>
        {{todo.text}}
        <button @click="$emit('remove',todo.id)">
            X
        </button>
    </li>
</template>
<script>
    export default {
        props:{
            todo:{
                type:Object,
                required:true
            }
        }
    }
</script>
<style scoped>
    li{
        word-wrap: break-word;
        max-width:70%;
    }
    button{
        border-radius: 10px;
    }
</style>