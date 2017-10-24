## 1. Obtener un Token de Acceso

Al completar el registro de la aplicación (Alta del Comercio), obtendrás dos llaves con las cuales te podrás autenticar en el sistema, a estas les llamamos **client_id** (identificador) y **client_secret** (Clave Secreta).

![Ejemplo de client_id y client_secret](images/portal-1.png)

Con estas credenciales podrás obtener el **token de acceso** llamando a la **API de Autenticación** de la siguiente forma:

```export CLIENT_ID=772778451507664600860
export CLIENT_ID=772778451507664600860
export CLIENT_SECRET=3f9IecqBbiZew3sOQhzSPF62xHdgGzNHx2kShWpaqzaT
curl -v -X POST https://quickpay-connect-sso.azurewebsites.net/oauth2/v2/token \
 -H "Content-Type:application/x-www-form-urlencoded" \
 -H "Authorization: Basic $CLIENT_ID:$CLIENT_SECRET" \
 -d "grant_type=client_credentials" | json_pp
```

> El **CLIENT_ID** y **CLIENT_SECRET** utilizados en esta petición son datos de prueba.

Como respuesta obtendrás el **access_token**:

```
{
   "expires_in" : 1507920388,
   "scope" : "profile",
   "token_type" : "Bearer",
   "access_token" : "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmltYXJ5c2lkIjoiYTNiZTFiYzYtNDM4YS1jMzVlLWU2MDMtYjE1ZjJkMzBjZmI5IiwidW5pcXVlX25hbWUiOiJDb21lcmNpbyBkZSBQcnVlYmEiLCJncm91cHNpZCI6IkFQUEwiLCJpc3MiOiJGYWxhYmVsbGEiLCJhdWQiOiJXZWIiLCJzY29wZSI6WyJwcm9maWxlIl0sImlhdCI6MTUwNzgzMzk4OCwiZXhwIjozMDE1NzU0Mzc2fQ.FyTeDIhXhPDUy9yUq1-rDSCLhdjG2Dq3k42AcnK-PuCb6g1nfa-N52x_zI2SNmhf0TtdJcBIacfW7CXegCbU3_chcIPJJoxSkfp-GdOddzOx_loQrCwxcrlyI4tJNlGgxieNsoOXvgaC7PjfydUF23Z5GkdqK31nf5Uwc6sP38gqf-rq9CNfKLVejwEGdRPgt1YOmm87TVQax3BjVxu7GgMKzKxIa5kP72tvy0Ss3d7WMq4ZrQXWQ50a1lRa_LNwZPjJOibN-q7n8xMbHO8wXenpt2q4-U7T0cHag1IXFdZ79CfUgPMmVFKTyeY5fZDWcgKcbCpmHPbJlpKYqLI7eA"
}
```

Con el **access_token** generado, ya puedes comenzar a usar nuestras APIs para completar los pasos siguientes. 
