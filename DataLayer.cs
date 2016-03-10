using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Objects;

namespace SYSGER.Model
{
    public class DataLayer
    {
        private SYSGEREntities entities = new SYSGEREntities();

        public Model.recrutement GetRecrutmentByID(long id)
        {
            // Check we have an ObjectContext
            if (entities == null) entities = new SYSGEREntities();

            // Create a query from the entityset
            ObjectQuery<recrutement> e = entities.recrutements;

            // Create detached entities
            e.MergeOption = MergeOption.OverwriteChanges;

            // Define the query
            var query = from c in e
                        where c.recrutementID == id
                        select c;

            // Execute the query
            List<recrutement> results = query.ToList();

            // Return the results in a List
            return results.First();
        }



        public void AddRecrutement(Model.recrutement d)
        {
            entities.AddTorecrutements(d);
            entities.SaveChanges();
        }

        public void UpdateRecrutement(Model.recrutement d)
        {
            entities.recrutements.ApplyCurrentValues(d);
            entities.SaveChanges();
        }

    }
}