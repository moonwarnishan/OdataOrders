using Microsoft.EntityFrameworkCore;

namespace ODataOrders.Data
{
    public class ODataOrderContext:DbContext
    {
        public ODataOrderContext(DbContextOptions<ODataOrderContext> options):base(options)
        {
            
        }

        public DbSet<Customer> Customers { get; set; }
        public DbSet<Order> ODataOrders { get; set; }

    }
}
