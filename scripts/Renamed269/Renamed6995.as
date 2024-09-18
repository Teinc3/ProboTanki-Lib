package Renamed1
{
   import Renamed211.Renamed908;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed4604 extends Renamed1444 implements Renamed609
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed1308:Decal;
      
      private var position:Vector3;
      
      private var Renamed6993:Vector3;
      
      private var material:TextureMaterial;
      
      private var radius:Number;
      
      private var Renamed4164:int;
      
      private var fadeTime:int;
      
      private var Renamed6994:int;
      
      public function Renamed4604(param1:Renamed1443)
      {
         this.position = new Vector3();
         this.Renamed6993 = new Vector3();
         super(param1);
      }
      
      public function init(param1:Vector3, param2:TextureMaterial, param3:Vector3, param4:Number, param5:int, param6:int) : void
      {
         this.position.copy(param1);
         this.Renamed6993.copy(param3);
         this.radius = param4;
         this.material = param2;
         this.Renamed4164 = param5;
         this.fadeTime = param6;
         this.Renamed6994 = param6;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.Renamed1308 = battleService.Renamed621().Renamed1423(this.position,this.Renamed6993,this.radius,this.material);
         if(this.Renamed1308 == null)
         {
            this.kill();
         }
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.Renamed6994 > 0)
         {
            if(this.Renamed4164 > 0)
            {
               this.Renamed4164 -= param1;
            }
            else
            {
               this.Renamed6994 -= param1;
               if(this.Renamed1308 != null)
               {
                  this.Renamed1308.alpha = this.Renamed6994 / this.fadeTime;
               }
            }
            return true;
         }
         return false;
      }
      
      public function destroy() : void
      {
         if(this.Renamed1308 != null)
         {
            battleService.Renamed621().Renamed1307(this.Renamed1308);
            this.Renamed1308 = null;
         }
         this.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.Renamed6994 = 0;
      }
   }
}

