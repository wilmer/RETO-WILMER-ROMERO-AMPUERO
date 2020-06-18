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
    [RoutePrefix("api/tipocomplejo")]
    public class TipoComplejoController : ApiController
    {
  
        [HttpGet]
        [Route("GetId")]
        public IHttpActionResult GetId(int id)
        {
            //var customerFake = "customer-fake: " + id;
            //return Ok(customerFake);
            TTTipoComplejo TipoComplejo = new TTTipoComplejo();
            try
            {
                using (gestolimpEntities db = new gestolimpEntities())
                {
                    TipoComplejo = db.TTTipoComplejo.First(c=>c.IdTipoComplejo==id);
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Json(TipoComplejo);
        }

        [HttpGet]
        [Route("GetAll")]
        public IHttpActionResult GetAll()
        {
            List<TTTipoComplejo> listaTipoComplejo = new List<TTTipoComplejo>();
            try
            {
                using (gestolimpEntities db = new gestolimpEntities())
                {
                     listaTipoComplejo = db.TTTipoComplejo.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Json(listaTipoComplejo);
        }

        [HttpPost]
        [Route("CreateTipoComplejo")]
        public IHttpActionResult CreateTipoComplejo(string descripcion)
        {
            TTTipoComplejo model = new TTTipoComplejo();
            try
            {
                using (var context = new gestolimpEntities())
                {
                   
                    model.DescriTipoComplejo = descripcion;
                    context.TTTipoComplejo.Add(model);
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
        [Route("UpdateTipoComplejo")]
        public IHttpActionResult UpdateTipoComplejo(int id,string descripcion)
        {
            TTTipoComplejo model = new TTTipoComplejo();
            try
            {
                using (var context = new gestolimpEntities())
                {
                    model.IdTipoComplejo = id;
                    model.DescriTipoComplejo = descripcion;
                    context.Entry(model).State= System.Data.Entity.EntityState.Modified;
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
        [Route("DeleteTipoComplejo")]
        public IHttpActionResult DeleteTipoComplejo(int id)
        {
           TTTipoComplejo model = new TTTipoComplejo();
            try
            {
                using (var context = new gestolimpEntities())
                {
                     model = context.TTTipoComplejo.Find(id);
                    context.TTTipoComplejo.Remove(model);
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
