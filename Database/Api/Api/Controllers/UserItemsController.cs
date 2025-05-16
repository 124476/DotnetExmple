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
    public class UserItemsController : ApiController
    {
        private WPFExmpleDataBaseEntities db = new WPFExmpleDataBaseEntities();

        // GET: api/UserItems
        public IQueryable<UserItems> GetUserItems()
        {
            return db.UserItems;
        }

        // GET: api/UserItems/5
        [ResponseType(typeof(UserItems))]
        public IHttpActionResult GetUserItems(int id)
        {
            UserItems userItems = db.UserItems.Find(id);
            if (userItems == null)
            {
                return NotFound();
            }

            return Ok(userItems);
        }

        // PUT: api/UserItems/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutUserItems(int id, UserItems userItems)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != userItems.Id)
            {
                return BadRequest();
            }

            db.Entry(userItems).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserItemsExists(id))
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

        // POST: api/UserItems
        [ResponseType(typeof(UserItems))]
        public IHttpActionResult PostUserItems(UserItems userItems)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.UserItems.Add(userItems);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = userItems.Id }, userItems);
        }

        // DELETE: api/UserItems/5
        [ResponseType(typeof(UserItems))]
        public IHttpActionResult DeleteUserItems(int id)
        {
            UserItems userItems = db.UserItems.Find(id);
            if (userItems == null)
            {
                return NotFound();
            }

            db.UserItems.Remove(userItems);
            db.SaveChanges();

            return Ok(userItems);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserItemsExists(int id)
        {
            return db.UserItems.Count(e => e.Id == id) > 0;
        }
    }
}