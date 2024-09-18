package Renamed485
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import controls.InventoryIcon;
   import flash.utils.getTimer;
   
   public class Renamed9565
   {
      private var id:int;
      
      private var _count:EncryptedInt;
      
      private var clientObject:ClientObject;
      
      private var icon:InventoryIcon;
      
      private var Renamed9582:int = -1;
      
      private var Renamed9583:int;
      
      public function Renamed9565(param1:ClientObject, param2:int, param3:int, param4:int)
      {
         super();
         this.clientObject = param1;
         this.id = param2;
         this.icon = new InventoryIcon(param2);
         this._count = new EncryptedIntImpl(param3);
         this.Renamed9583 = param4;
      }
      
      public function Renamed9584() : ClientObject
      {
         return this.clientObject;
      }
      
      public function getId() : int
      {
         return this.id;
      }
      
      public function getIcon() : InventoryIcon
      {
         return this.icon;
      }
      
      public function Renamed9579() : int
      {
         return this.Renamed9583;
      }
      
      public function Renamed9585(param1:int) : Number
      {
         if(this.Renamed9582 == -1)
         {
            return 1;
         }
         var _loc2_:Number = (param1 - this.Renamed9582) / this.Renamed9583;
         if(_loc2_ > 1)
         {
            _loc2_ = 1;
            this.Renamed9566();
         }
         return _loc2_;
      }
      
      public function Renamed9566() : void
      {
         this.Renamed9582 = -1;
      }
      
      public function Renamed9586(param1:int) : void
      {
         this.Renamed9583 = param1;
         this.Renamed9582 = getTimer();
      }
      
      public function set count(param1:int) : void
      {
         this._count.setInt(param1);
      }
      
      public function get count() : int
      {
         return this._count.getInt();
      }
      
      public function Renamed9587() : Boolean
      {
         return this.Renamed9582 < 0 && (this._count.getInt() > 0 || this._count.getInt() == -1);
      }
   }
}

