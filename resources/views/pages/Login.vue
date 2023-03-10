<template>
    <div class="form-box">
        <form class="form">
            <span class="title">Login</span>
            <span class="subtitle">Entre no sistema</span>
            <div class="form-container">
                <input type="email" class="input" placeholder="Email">
                <input type="password" class="input" placeholder="Password">
            </div>
            <button>Login</button>
        </form>
        <div class="form-section">
            <p>Já tem uma conta? <router-link to="/login">Login</router-link></p>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'Login',
    };
</script>
  
<style scoped>
    /* Importa o arquivo CSS um nível acima */
    @import "../../css/app.css";
</style>

