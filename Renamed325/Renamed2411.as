package Renamed325
{
   import Renamed137.Renamed2400;
   import Renamed487.Renamed5336;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.bonuses.BattleBonus;
   import alternativa.tanks.bonuses.BattleBonusData;
   import alternativa.tanks.bonuses.Bonus;
   import alternativa.utils.TextureMaterialRegistry;
   import Renamed358.Renamed7751;
   import Renamed358.Renamed4667;
   import flash.display.BitmapData;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Renamed2411 extends Renamed7751 implements Renamed2400, Renamed4667
   {
      [Inject]
      public static var Renamed1368:TextureMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed7752:Number = 4;
      
      public function Renamed2411()
      {
         super();
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:BattleBonusData = new BattleBonusData();
         _loc2_.boxMesh = this.Renamed7753(getInitParam().Renamed5369);
         _loc2_.parachuteOuterMesh = this.Renamed7753(getInitParam().parachuteResource);
         _loc2_.parachuteInnerMesh = this.Renamed7753(getInitParam().parachuteInnerResource);
         _loc2_.cordsMaterial = Renamed1368.getMaterial(getInitParam().cordResource.data);
         _loc2_.cordsMaterial.resolution = 5;
         if(getInitParam().pickupSoundResource != null)
         {
            _loc2_.pickupSound = getInitParam().pickupSoundResource.sound;
         }
         _loc2_.lifeTimeMs = getInitParam().lifeTimeMs;
         var _loc3_:Renamed5336 = Renamed5336(param1.getParams(Renamed5336));
         _loc2_.lightColor = _loc3_.Renamed7754().Renamed772();
         _loc2_.lightIntensity = _loc3_.Renamed7754().Renamed5124();
         _loc2_.attenuationBegin = _loc3_.Renamed5111();
         _loc2_.attenuationEnd = _loc3_.Renamed5112();
         param1.putParams(BattleBonusData,_loc2_);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:BattleBonusData = BattleBonusData(param1.removeParams(BattleBonusData));
         Renamed1368.releaseMaterial(this.Renamed7755(_loc2_.boxMesh));
         Renamed1368.releaseMaterial(this.Renamed7755(_loc2_.parachuteInnerMesh));
         Renamed1368.releaseMaterial(this.Renamed7755(_loc2_.parachuteOuterMesh));
         Renamed1368.releaseMaterial(_loc2_.cordsMaterial);
      }
      
      public function Renamed2520(param1:ClientObject, param2:String) : Bonus
      {
         var _loc3_:BattleBonusData = BattleBonusData(param1.getParams(BattleBonusData));
         var _loc4_:BattleBonus = BattleBonus(battleService.Renamed618().getObject(BattleBonus));
         _loc4_.init(param2,param2,_loc3_,battleService);
         return _loc4_;
      }
      
      private function Renamed7755(param1:Mesh) : TextureMaterial
      {
         var _loc2_:Face = param1.faces[0];
         return TextureMaterial(_loc2_.material);
      }
      
      private function Renamed7753(param1:Tanks3DSResource) : Mesh
      {
         var _loc2_:Mesh = Mesh(param1.objects[0]);
         var _loc3_:BitmapData = param1.getTextureForObject(0);
         if(_loc3_ == null)
         {
            _loc3_ = new StubBitmapData(65280);
         }
         var _loc4_:Mesh = Mesh(_loc2_.clone());
         var _loc5_:TextureMaterial;
         (_loc5_ = Renamed1368.getMaterial(_loc3_)).resolution = 1;
         _loc4_.setMaterialToAllFaces(_loc5_);
         return _loc4_;
      }
   }
}

