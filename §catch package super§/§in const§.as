package §catch package super§
{
   import § !V§.§=p§;
   import §]R§.§in true§;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.bonuses.BattleBonus;
   import alternativa.tanks.bonuses.BattleBonusData;
   import alternativa.tanks.bonuses.Bonus;
   import alternativa.utils.TextureMaterialRegistry;
   import §extends var default§.§dynamic var finally§;
   import §extends var default§.§true catch function§;
   import flash.display.BitmapData;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class §in const§ extends §dynamic var finally§ implements §=p§, §true catch function§
   {
      [Inject]
      public static var §@#R§:TextureMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const §##K§:Number = 4;
      
      public function §in const§()
      {
         super();
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:BattleBonusData = new BattleBonusData();
         _loc2_.boxMesh = this.§while super§(getInitParam().§package set include§);
         _loc2_.parachuteOuterMesh = this.§while super§(getInitParam().parachuteResource);
         _loc2_.parachuteInnerMesh = this.§while super§(getInitParam().parachuteInnerResource);
         _loc2_.cordsMaterial = §@#R§.getMaterial(getInitParam().cordResource.data);
         _loc2_.cordsMaterial.resolution = 5;
         if(getInitParam().pickupSoundResource != null)
         {
            _loc2_.pickupSound = getInitParam().pickupSoundResource.sound;
         }
         _loc2_.lifeTimeMs = getInitParam().lifeTimeMs;
         var _loc3_:§in true§ = §in true§(param1.getParams(§in true§));
         _loc2_.lightColor = _loc3_.§get for import§().§#!@§();
         _loc2_.lightIntensity = _loc3_.§get for import§().§"#`§();
         _loc2_.attenuationBegin = _loc3_.§super const native§();
         _loc2_.attenuationEnd = _loc3_.§with set true§();
         param1.putParams(BattleBonusData,_loc2_);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:BattleBonusData = BattleBonusData(param1.removeParams(BattleBonusData));
         §@#R§.releaseMaterial(this.§do var for§(_loc2_.boxMesh));
         §@#R§.releaseMaterial(this.§do var for§(_loc2_.parachuteInnerMesh));
         §@#R§.releaseMaterial(this.§do var for§(_loc2_.parachuteOuterMesh));
         §@#R§.releaseMaterial(_loc2_.cordsMaterial);
      }
      
      public function §include package var§(param1:ClientObject, param2:String) : Bonus
      {
         var _loc3_:BattleBonusData = BattleBonusData(param1.getParams(BattleBonusData));
         var _loc4_:BattleBonus = BattleBonus(battleService.§class while§().getObject(BattleBonus));
         _loc4_.init(param2,param2,_loc3_,battleService);
         return _loc4_;
      }
      
      private function §do var for§(param1:Mesh) : TextureMaterial
      {
         var _loc2_:Face = param1.faces[0];
         return TextureMaterial(_loc2_.material);
      }
      
      private function §while super§(param1:Tanks3DSResource) : Mesh
      {
         var _loc2_:Mesh = Mesh(param1.objects[0]);
         var _loc3_:BitmapData = param1.getTextureForObject(0);
         if(_loc3_ == null)
         {
            _loc3_ = new StubBitmapData(65280);
         }
         var _loc4_:Mesh = Mesh(_loc2_.clone());
         var _loc5_:TextureMaterial;
         (_loc5_ = §@#R§.getMaterial(_loc3_)).resolution = 1;
         _loc4_.setMaterialToAllFaces(_loc5_);
         return _loc4_;
      }
   }
}

