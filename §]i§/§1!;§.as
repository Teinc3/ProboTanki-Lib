package §]i§
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import controls.InventoryIcon;
   import flash.utils.getTimer;
   
   public class §1!;§
   {
      private var id:int;
      
      private var _count:EncryptedInt;
      
      private var clientObject:ClientObject;
      
      private var icon:InventoryIcon;
      
      private var §"#'§:int = -1;
      
      private var §==§:int;
      
      public function §1!;§(param1:ClientObject, param2:int, param3:int, param4:int)
      {
         super();
         this.clientObject = param1;
         this.id = param2;
         this.icon = new InventoryIcon(param2);
         this._count = new EncryptedIntImpl(param3);
         this.§==§ = param4;
      }
      
      public function §4#K§() : ClientObject
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
      
      public function §for var with§() : int
      {
         return this.§==§;
      }
      
      public function §@#m§(param1:int) : Number
      {
         if(this.§"#'§ == -1)
         {
            return 1;
         }
         var _loc2_:Number = (param1 - this.§"#'§) / this.§==§;
         if(_loc2_ > 1)
         {
            _loc2_ = 1;
            this.§2U§();
         }
         return _loc2_;
      }
      
      public function §2U§() : void
      {
         this.§"#'§ = -1;
      }
      
      public function §in catch finally§(param1:int) : void
      {
         this.§==§ = param1;
         this.§"#'§ = getTimer();
      }
      
      public function set count(param1:int) : void
      {
         this._count.setInt(param1);
      }
      
      public function get count() : int
      {
         return this._count.getInt();
      }
      
      public function §dynamic set true§() : Boolean
      {
         return this.§"#'§ < 0 && (this._count.getInt() > 0 || this._count.getInt() == -1);
      }
   }
}

