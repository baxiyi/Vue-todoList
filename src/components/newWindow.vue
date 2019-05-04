<template>
    <div class="dialog">
        <div class="dialog-cover" v-if="isShow" @click="fail"></div>
            <div class="dialog-content" v-if="isShow">
                <p class="title">New Item</p>
                <textArea class="dialog-text" v-on="listeners"></textArea>
                <div class="buttonDiv">
                    <button class="dialog-ok" :class="{'dialog-ok-active':isActive}" @click="success">OK</button>
                    <button class="dialog-cancel" @click="fail">Cancel</button>
                </div>
            </div>
    </div>
</template>

<script>
    export default {
        name: "newWindow",
        props:{
            isShow:{
                type:Boolean,
                default:false,
                required:true
            },
            value:{
                type:String,
                default:""
            }
        },
        computed:{
            isActive:function(){
                return this.value!=='';
            },
            listeners(){
                return {
                    ...this.$listeners,
                    input:event=>{
                        this.$emit("input",event.target.value);
                    }
                }
            }
        },
        methods:{
            success:function(){
                //console.log("success");
                if(this.isActive){
                    this.$emit("success-close");
                }
            },
            fail:function(){
                this.$emit("fail-close");
            }
        }
    }
</script>

<style scoped>
.dialog{
    position:relative;
    font-size:16px;
}
    .dialog-cover{
        background:rgba(0, 0, 0, 0.6);
        position:fixed;
        z-index:200;
        top:0;
        left:0;
        width: 100%;
        height:100%;
    }
    .dialog-content{
        position:fixed;
        width:40%;
        height:40%;
        top:50%;
        left:50%;
        transform: translate(-50%,-50%);
        display:flex;
        flex-direction:column;
        justify-content: space-around;
        align-items:center;
        z-index:300;
        background-color:navajowhite;
    }
    .dialog-text{
        height:40%;
        width:60%;
    }
    .buttonDiv{
        position:relative;
        width:100%;
        height:20%;
    }
    .dialog-ok{
        position:absolute;
        left:25%;
        top:50%;
        transform: translate(0,-50%);
        color:darkgray;
    }
    .dialog-ok-active{
        color:black;
    }
    .dialog-cancel{
        position:absolute;
        right:25%;
        top:50%;
        transform: translate(0,-50%);
    }
</style>