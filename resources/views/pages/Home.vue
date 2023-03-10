<template>
    <div class="form-box">
        <form class="form" @submit.prevent="registerUser">
            <span class="title">Sign up</span>
            <span class="subtitle">Create a free account with your email.</span>
            <div class="form-container">
                <input type="text" class="input" placeholder="Full Name" v-model="form.name">
                <input type="email" class="input" placeholder="Email" v-model="form.email">
                <input type="password" class="input" placeholder="Password" v-model="form.password">
            </div>
            <button type="submit">Sign up</button>
        </form>
        <div class="form-section">
            <p>Já tem uma conta? <router-link to="/login">Login</router-link></p>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';
    export default {
        name: 'Home',
        data () {
            return {
                form: {
                    name: '',
                    email: '',
                    password: ''
                }
            }
        },
        methods: {
            async registerUser() {
                try {
                    const response = await axios.post("/api/register", this.form);
                    console.log(response.data);
                    // aqui você pode redirecionar para outra página ou mostrar uma mensagem de sucesso
                } catch (error) {
                    console.error(error);
                    // aqui você pode mostrar uma mensagem de erro
                }
            },
        },
    }
</script>
  
<style scoped>
    /* Importa o arquivo CSS um nível acima */
    @import "../../css/app.css";
</style>
