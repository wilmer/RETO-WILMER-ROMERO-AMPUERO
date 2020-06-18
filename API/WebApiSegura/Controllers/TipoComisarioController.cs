using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiSegura.DBModel;

namespace WebApiSegura.Controllers
{
    [Authorize]
    [RoutePrefix("api/tipocomisario")]
    public class TipoComisarioController : ApiController
    {
        [HttpGet]
        [Route("GetId")]
        public IHttpActionResult GetId(int id)
        {
            //var customerFake = "customer-fake: " + id;
            //return Ok(customerFake);
            TTTipoComisario TipoComisario = new TTTipoComisario();
            try
            {
                using (gestolimpEntities db = new gestolimpEntities())
                {
                    TipoComisario = db.TTTipoComisario.First(c => c.IdTipoComisario == id);
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Json(TipoComisario);
        }

        [HttpGet]
        [Route("GetAll")]
        public IHttpActionResult GetAll()
        {
            List<TTTipoComisario> listaTipoComisario = new List<TTTipoComisario>();
            try
            {
                using (gestolimpEntities db = new gestolimpEntities())
                {
                    listaTipoComisario = db.TTTipoComisario.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Json(listaTipoComisario);
        }

        [HttpPost]
        [Route("CreateTipoComisario")]
        public IHttpActionResult CreateTipoComisario(string descripcion)
        {
            TTTipoComisario model = new TTTipoComisario();
            try
            {
                using (var context = new gestolimpEntities())
                {

                    model.DescriTipoComisario = descripcion;
                    context.TTTipoComisario.Add(model);
                    context.SaveChanges();

                }
            }
            catch (Exception)
            {

                throw;
            }
            return Json(model);
        }
        [HttpPost]
        [Route("UpdateTipoComisario")]
        public IHttpActionResult UpdateTipoComisario(int id, string descripcion)
        {
            TTTipoComisario model = new TTTipoComisario();
            try
            {
                using (var context = new gestolimpEntities())
                {
                    model.IdTipoComisario = id;
                    model.DescriTipoComisario = descripcion;
                    context.Entry(model).State = System.Data.Entity.EntityState.Modified;
                    context.SaveChanges();

                }
            }
            catch (Exception)
            {

                throw;
            }
            return Json(model);
        }

        [HttpPost]
        [Route("DeleteTipoComisario")]
        public IHttpActionResult DeleteTipoComplejo(int id)
        {
            TTTipoComisario model = new TTTipoComisario();
            try
            {
                using (var context = new gestolimpEntities())
                {
                    model = context.TTTipoComisario.Find(id);
                    context.TTTipoComisario.Remove(model);
                    context.SaveChanges();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Json(model);
        }
    }
}
