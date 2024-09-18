package Renamed4567
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.models.weapon.shared.Renamed2943;
   import Renamed356.Renamed1443;
   import flash.errors.IllegalOperationError;
   import Renamed373.Renamed666;
   
   public class Renamed6074 extends Renamed4568
   {
      private static const Renamed6075:Vector3 = new Vector3();
      
      public function Renamed6074(param1:Renamed1443)
      {
         super(param1);
      }
      
      override protected function update(param1:Number) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Body = null;
         var _loc4_:Vector3 = null;
         this.Renamed6076(param1);
         Renamed6075.diff(Renamed6058,Renamed1148);
         var _loc5_:Number = Renamed6075.length();
         Renamed6075.normalize();
         var _loc6_:CollisionDetector = battleService.Renamed619().Renamed692();
         if(_loc6_.raycast(Renamed1148,Renamed6075,Renamed666.WEAPON,_loc5_,this,Renamed672))
         {
            _loc2_ = Renamed668.Renamed687(Renamed672.shape.body) && !Renamed2943.Renamed2967(Renamed1148,Renamed672.position);
            Renamed6051.copy(Renamed672.position);
            if(_loc2_)
            {
               _loc3_ = Renamed672.shape.body;
            }
            else
            {
               _loc3_ = null;
               Renamed6051.subtract(Renamed6075);
            }
            Renamed6069(_loc3_,Renamed6051,Renamed6075,_loc5_);
            return;
         }
         var _loc7_:int = 0;
         while(_loc7_ < Renamed6062())
         {
            _loc4_ = Renamed6059[_loc7_];
            if(_loc6_.raycast(_loc4_,Renamed6075,Renamed666.WEAPON,_loc5_,this,Renamed672))
            {
               if(Renamed668.Renamed687(Renamed672.shape.body))
               {
                  if(!Renamed2943.Renamed2967(Renamed1148,Renamed672.position))
                  {
                     Renamed6051.copy(Renamed1148).addScaled(Renamed672.t,Renamed6075);
                     Renamed6069(Renamed672.shape.body,Renamed6051,Renamed6075,_loc5_);
                     return;
                  }
               }
            }
            _loc4_.addScaled(_loc5_,Renamed6075);
            _loc7_++;
         }
         Renamed6060.updateState(Renamed6058,Renamed6057);
         this.Renamed6077(param1);
         if(this.Renamed6078())
         {
            this.Renamed6079();
         }
      }
      
      override protected function Renamed6072(param1:Body, param2:Vector3, param3:Vector3, param4:Number, param5:int) : void
      {
         Renamed6060.updateState(param2,param3,param5);
      }
      
      protected function Renamed6077(param1:Number) : void
      {
         Renamed1469 += param1 * this.Renamed2706();
      }
      
      protected function Renamed6079() : void
      {
         destroy();
      }
      
      protected function Renamed6078() : Boolean
      {
         return Renamed1469 > this.Renamed6080();
      }
      
      protected function Renamed6080() : Number
      {
         return Number.MAX_VALUE;
      }
      
      protected function Renamed2706() : Number
      {
         throw new IllegalOperationError();
      }
      
      protected function Renamed6076(param1:Number) : void
      {
         Renamed1148.copy(Renamed6058);
         Renamed6058.addScaled(this.Renamed2706() * param1,Renamed6057);
      }
   }
}

