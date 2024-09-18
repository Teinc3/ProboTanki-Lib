package Renamed41
{
   import Renamed194.Renamed5918;
   import Renamed194.Renamed5920;
   import Renamed194.Renamed4564;
   import Renamed194.Renamed5927;
   import Renamed279.Renamed4609;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import forms.ColorConstants;
   
   public class Renamed42 extends Renamed5927 implements Renamed4564
   {
      [Inject]
      public static var Renamed2775:TankUsersRegistry;
      
      public function Renamed42()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5925(param1:Vector.<Renamed5920>) : void
      {
         var _loc2_:Renamed5920 = null;
         var _loc3_:Tank = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Object3D = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_.target != null)
            {
               _loc3_ = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(Renamed2775.Renamed695(_loc2_.target)).tank;
               _loc4_ = Renamed668.Renamed669;
               if(_loc3_.Renamed949)
               {
                  _loc4_.copy(_loc3_.Renamed948);
                  Renamed668.localToGlobal(_loc3_.Renamed696(),_loc4_);
               }
               else
               {
                  _loc5_ = _loc3_.Renamed1075().Renamed1268();
                  _loc4_.reset(_loc5_.x,_loc5_.y,_loc5_.z);
               }
               Renamed4609.start(_loc4_,this.Renamed8638(_loc2_),_loc2_.Renamed5923);
            }
         }
      }
      
      private function Renamed8638(param1:Renamed5920) : uint
      {
         switch(param1.Renamed5924)
         {
            case Renamed5918.FATAL:
               return ColorConstants.USER_TITLE_RED;
            case Renamed5918.CRITICAL:
               return ColorConstants.USER_TITLE_YELLOW;
            case Renamed5918.HEAL:
               return ColorConstants.GREEN_TEXT;
            default:
               return ColorConstants.WHITE;
         }
      }
   }
}

