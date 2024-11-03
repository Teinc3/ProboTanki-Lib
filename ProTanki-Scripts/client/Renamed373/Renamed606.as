package Renamed373
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   
   public class Renamed606
   {
      public var id:int;
      
      public var body:Body;
      
      public var Renamed1043:CollisionBox;
      
      public var Renamed1133:Vector.<CollisionShape>;
      
      public var Renamed1008:Boolean;
      
      public var Renamed1012:Vector.<Body>;
      
      public var Renamed8276:Boolean;
      
      public var Renamed1030:Vector3;
      
      public var Renamed8303:Number = 0;
      
      private var Renamed8305:Renamed4679;
      
      public function Renamed606(param1:Body)
      {
         this.Renamed1133 = new Vector.<CollisionShape>();
         this.Renamed1012 = new Vector.<Body>();
         this.Renamed1030 = new Vector3();
         super();
         this.body = param1;
      }
      
      public function Renamed1002() : void
      {
         this.Renamed8305 = new Renamed4679(this);
      }
      
      public function Renamed1010() : Boolean
      {
         return this.Renamed1012.length > 0;
      }
      
      public function destroy() : void
      {
         this.Renamed8305 = null;
         this.body = null;
         this.Renamed1133 = null;
         this.Renamed1012 = null;
      }
      
      public function Renamed8297() : void
      {
         this.Renamed8305.Renamed8297();
      }
      
      public function Renamed1124() : Boolean
      {
         return this.Renamed8305.Renamed1124();
      }
      
      public function Renamed1128() : Boolean
      {
         return this.Renamed8305.Renamed1128();
      }
      
      public function Renamed1129() : Boolean
      {
         return this.Renamed8305.Renamed1129();
      }
      
      public function Renamed1130() : Boolean
      {
         return this.Renamed8305.Renamed1130();
      }
   }
}

