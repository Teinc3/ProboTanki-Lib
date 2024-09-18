package §switch package return§
{
   public class §>!K§
   {
      public var head:§super catch use§;
      
      public var tail:§super catch use§;
      
      public function §>!K§()
      {
         super();
      }
      
      public function §^"U§(param1:§super catch use§) : void
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
      
      public function §default package use§(param1:§super catch use§) : void
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
      
      public function §do var throw§() : void
      {
         while(this.head != null)
         {
            this.§default package use§(this.head);
         }
      }
   }
}

