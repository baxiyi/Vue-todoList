<template>
    <div>
        <span>+</span>New
    </div>
</template>

<script>
    export default {
        name: "newButton"
    }
</script>

<style scoped>
    div{
        background-color: #28a745;
        color:white;
        font-weight: 600;
        text-align: center;
        display:inline-block;
        border-radius: 5px;
        padding:1px 5px;
    }
    div:hover{
        border:1px solid black;
    }
    span{
        font-size: 1.5em;
        margin-right: .2em;
    }
</style>