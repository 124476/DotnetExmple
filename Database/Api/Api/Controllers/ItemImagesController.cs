using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Api.Models;

namespace Api.Controllers
{
    public class ItemImagesController : ApiController
    {
        private WPFExmpleDataBaseEntities db = new WPFExmpleDataBaseEntities();

        // GET: api/ItemImages
        public IQueryable<ItemImages> GetItemImages()
        {
            return db.ItemImages;
        }

        // GET: api/ItemImages/5
        [ResponseType(typeof(ItemImages))]
        public IHttpActionResult GetItemImages(int id)
        {
            ItemImages itemImages = db.ItemImages.Find(id);
            if (itemImages == null)
            {
                return NotFound();
            }

            return Ok(itemImages);
        }

        // PUT: api/ItemImages/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutItemImages(int id, ItemImages itemImages)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != itemImages.Id)
            {
                return BadRequest();
            }

            db.Entry(itemImages).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ItemImagesExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/ItemImages
        [ResponseType(typeof(ItemImages))]
        public IHttpActionResult PostItemImages(ItemImages itemImages)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ItemImages.Add(itemImages);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = itemImages.Id }, itemImages);
        }

        // DELETE: api/ItemImages/5
        [ResponseType(typeof(ItemImages))]
        public IHttpActionResult DeleteItemImages(int id)
        {
            ItemImages itemImages = db.ItemImages.Find(id);
            if (itemImages == null)
            {
                return NotFound();
            }

            db.ItemImages.Remove(itemImages);
            db.SaveChanges();

            return Ok(itemImages);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ItemImagesExists(int id)
        {
            return db.ItemImages.Count(e => e.Id == id) > 0;
        }
    }
}