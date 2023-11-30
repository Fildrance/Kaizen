namespace Kaizen.Common.Service.Contracts
{
    /// <summary> Base class for filter contract. Contains properties for paging. </summary>
    public abstract class FilterContractBase
    {
        /// <summary>
        /// Amount of records to be taken. If 'null', all records will be taken.
        /// </summary>
        public int? Take { get; set; }
        /// <summary>
        /// Amount of records to be skipped. If 'null', no records will be skipped.
        /// </summary>
        public int? Skip { get; set; }
    }
}
