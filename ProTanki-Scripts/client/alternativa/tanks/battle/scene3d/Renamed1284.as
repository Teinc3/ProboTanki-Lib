package alternativa.tanks.battle.scene3d
{
   import alternativa.tanks.battle.Renamed754;
   
   public class Renamed1284
   {
      private var Renamed1285:Vector.<Renamed919>;
      
      private var size:int;
      
      private var Renamed1286:Boolean;
      
      public function Renamed1284()
      {
         this.Renamed794 = new Vector.<Renamed754>();
         this.Renamed1285 = new Vector.<Renamed919>();
         super();
      }
      
      public function Renamed1287(param1:Renamed919) : void
      {
         if(this.Renamed1286)
         {
            this.Renamed794.push(new Renamed1288(this,param1));
         }
         else if(this.Renamed1285.indexOf(param1) < 0)
         {
            var _loc2_:* = this.size++;
            this.Renamed1285[_loc2_] = param1;
         }
      }
      
      public function Renamed1289(param1:Renamed919) : void
      {
         var _loc2_:int = 0;
         if(this.Renamed1286)
         {
            this.Renamed794.push(new Renamed1290(this,param1));
         }
         else
         {
            _loc2_ = int(this.Renamed1285.indexOf(param1));
            if(_loc2_ >= 0)
            {
               this.Renamed1285[_loc2_] = this.Renamed1285[--this.size];
               this.Renamed1285[this.size] = null;
            }
         }
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Renamed919 = null;
         this.Renamed1286 = true;
         var _loc4_:int = 0;
         while(_loc4_ < this.size)
         {
            _loc3_ = this.Renamed1285[_loc4_];
            _loc3_.render(param1,param2);
            _loc4_++;
         }
         this.Renamed1286 = false;
         this.Renamed1291();
      }
      
      private function Renamed1291() : void
      {
         var _loc1_:Renamed754 = null;
         while(_loc1_ = this.Renamed794.pop(), _loc1_ != null)
         {
            _loc1_.execute();
         }
      }
   }
}

