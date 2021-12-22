using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.AspNetCore.OData.Routing.Controllers;
using ODataOrders.Data;

namespace ODataOrders.Controllers
{
    public class CustomersController : ODataController
    {
        private readonly ODataOrderContext context;

        public CustomersController(ODataOrderContext context)
        {
            this.context=context;
        }

        [EnableQuery]
        public IActionResult Get()
        {
            return Ok(context.Customers);
        }

        [HttpPost]
        public async Task<IActionResult> Add(Customer customer)
        {
            context.Customers.Add(customer);
            await context.SaveChangesAsync();
            return Ok(customer);
        }



    }
}
