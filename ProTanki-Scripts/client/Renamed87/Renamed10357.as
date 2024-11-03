package Renamed87
{
   public class Renamed10353
   {
      public var head:Renamed4712;
      
      public var tail:Renamed4712;
      
      public function Renamed10353()
      {
         super();
      }
      
      public function Renamed10354(param1:Renamed4712) : void
      {
         if(this.head == null)
         {
            this.head = this.tail = param1;
         }
         else
         {
            this.tail.next = param1;
            param1.prev = this.tail;
            this.tail = param1;
         }
      }
      
      public function Renamed10355(param1:Renamed4712) : void
      {
         if(this.head == null)
         {
            return;
         }
         if(param1 == this.head)
         {
            if(param1 == this.tail)
            {
               this.head = this.tail = null;
            }
            else
            {
               this.head = this.head.next;
               this.head.prev = null;
            }
         }
         else if(param1 == this.tail)
         {
            this.tail = this.tail.prev;
            this.tail.next = null;
         }
         else
         {
            param1.prev.next = param1.next;
            param1.next.prev = param1.prev;
         }
         param1.dispose();
      }
      
      public function Renamed10356() : void
      {
         while(this.head != null)
         {
            this.Renamed10355(this.head);
         }
      }
   }
}

