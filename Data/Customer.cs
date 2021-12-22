namespace ODataOrders.Data
{
    public class Customer
    {
        public int Id { get; set; }
        public string Name { get; set; }=String.Empty;
        public string CountryId { get; set; }=String.Empty;

        public List<Order>? Orders { get; set; }
    }
}
