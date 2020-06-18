using System;
using System.Net;
using System.Threading;
using System.Web.Http;
using WebApiSegura.DBModel;
using WebApiSegura.Models;
using WebApiSegura.Security;

namespace WebApiSegura.Controllers
{
    /// <summary>
    /// login controller class for authenticate users
    /// </summary>
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        [HttpGet]
        [Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        [HttpGet]
        [Route("echouser")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        [HttpPost]
        [Route("authenticate")]
        public IHttpActionResult Authenticate(string Username, string Password)
        {
            LoginRequest login = new LoginRequest();
            login.Username = Username;
            login.Password = Password;

            if (login == null)
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            //TODO: This code is only for demo - extract method in new class & validate correctly in your application !!
             var isUserValid = (login.Username == "user" && login.Password == "123456");

            //var isUserValid = Exists(Username);
            //int idUsuario = GetUserById(Username);
            if (isUserValid)
            {
                var rolename = "Developer";
                var token = TokenGenerator.GenerateTokenJwt(login.Username, rolename);
                //Actualizo el token
                var updateToken = ActualizaToken(1, token);
                return Ok(token);
            }

            //TODO: This code is only for demo - extract method in new class & validate correctly in your application !!
            //var isTesterValid = (login.Username == "test" && login.Password == "123456");
            //if (isTesterValid)
            //{
            //    var rolename = "Tester";
            //    var token = TokenGenerator.GenerateTokenJwt(login.Username, rolename);
            //    return Ok(token);
            //}

            //TODO: This code is only for demo - extract method in new class & validate correctly in your application !!
            //var isAdminValid = (login.Username == "admin" && login.Password == "123456");
            //if (isAdminValid)
            //{
            //    var rolename = "Administrator";
            //    var token = TokenGenerator.GenerateTokenJwt(login.Username, rolename);
            //    return Ok(token);
            //}

            // Unauthorized access 
            return Unauthorized();
        }

        //public bool Exists(string user)
        //{
        //    bool existe = false;

        //   // TTTipoComisario TipoComisario = new TTTipoComisario();
        //    try
        //    {
        //        using (gestolimpEntities db = new gestolimpEntities())
        //        {
        //            var usuario = db.TS_TMUsuarios_ExisteUsuario(user);
        //            if(usuario != null)
        //            {
        //                existe = true;
        //            }
        //            else
        //            {
        //                existe = false;
        //            }

        //        }
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //    return existe;
        //}

        //public int GetUserById(string user)
        //{
        //    int idUsuario_User = 0;

        //    // TTTipoComisario TipoComisario = new TTTipoComisario();
        //    try
        //    {
        //        using (gestolimpEntities db = new gestolimpEntities())
        //        {
        //            int Idusuario = db.TMUsuarios.Find(user).IdUsuario;
        //            if (Idusuario != null)
        //            {
        //                idUsuario_User = Idusuario;
        //            }
        //            else
        //            {
        //                idUsuario_User = Idusuario;
        //            }

        //        }
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //    return idUsuario_User;
        //}

        public bool ActualizaToken(int idUser, string token)
        {
            bool actualizado = false;

            // TTTipoComisario TipoComisario = new TTTipoComisario();
            try
            {
                using (gestolimpEntities db = new gestolimpEntities())
                {
                    var update = db.TS_TMUsuarios_ActualizarToken(idUser, token);
                    if (update != 0)
                    {
                        actualizado = true;
                    }
                    else
                    {
                        actualizado = false;
                    }

                }
            }
            catch (Exception)
            {

                throw;
            }
            return actualizado;
        }
    }
}
