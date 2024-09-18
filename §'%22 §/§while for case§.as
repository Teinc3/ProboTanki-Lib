package §'" §
{
   import alternativa.tanks.model.bonus.showing.image.BonusImageShowingModel;
   import alternativa.tanks.model.bonus.showing.info.BonusInfoModel;
   import alternativa.tanks.model.bonus.showing.items.BonusItemModel;
   import alternativa.tanks.model.bonus.showing.items.BonusItemsShowingModel;
   import alternativa.types.Long;
   import §each else§.§,#D§;
   import §if try§.§return package if§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.panel.model.bonus.showing.image.BonusImageCC;
   import projects.tanks.client.panel.model.bonus.showing.info.BonusInfoCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemsShowingCC;
   
   public class §while for case§ extends §return package if§
   {
      private var §]"E§:BonusItemsShowingModel;
      
      private var §import catch while§:BonusInfoModel;
      
      private var §9#v§:BonusItemModel;
      
      private var §with package if§:BonusImageShowingModel;
      
      private var §^#4§:IGameClass;
      
      public var modelId:int;
      
      public function §while for case§()
      {
         super();
         this.modelId = 21;
         this.§]"E§ = BonusItemsShowingModel(modelRegistry.getModel(Long.getLong(0,300050008)));
         this.§import catch while§ = BonusInfoModel(modelRegistry.getModel(Long.getLong(0,300050006)));
         this.§9#v§ = BonusItemModel(modelRegistry.getModel(Long.getLong(0,300050007)));
         this.§with package if§ = BonusImageShowingModel(modelRegistry.getModel(Long.getLong(0,300050005)));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(this.§import catch while§.id);
         _loc1_.push(this.§9#v§.id);
         _loc1_.push(this.§]"E§.id);
         _loc1_.push(this.§with package if§.id);
         this.§^#4§ = gameTypeRegistry.createClass(Long.getLong(0,502350235),_loc1_);
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §-m§.§ !T§:
               this.show(param1);
               break;
            case §-m§.§super package package§:
               this.§;"D§(param1);
         }
      }
      
      private function show(param1:Object) : void
      {
         var _loc5_:* = undefined;
         var _loc6_:IGameObject = null;
         var _loc2_:IGameObject = spaceRegistry.getSpace(Long.getLong(884380667,214)).createObject(§,#D§.§return set extends§(),this.§^#4§,"BonusModelObject");
         var _loc3_:Object = JSON.parse(param1.json);
         var _loc4_:Vector.<IGameObject> = new Vector.<IGameObject>();
         for each(_loc5_ in _loc3_.items)
         {
            _loc6_ = spaceRegistry.getSpace(Long.getLong(884380667,214)).createObject(§,#D§.§return set extends§(),this.§^#4§,"BonusItem");
            Model.object = _loc6_;
            this.§9#v§.putInitParams(new BonusItemCC(_loc5_.count,ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc5_.preview)))));
            Model.popObject();
            _loc4_.push(_loc6_);
         }
         Model.object = _loc2_;
         this.§import catch while§.putInitParams(param1.bonusInfo);
         this.§]"E§.putInitParams(new BonusItemsShowingCC(_loc4_));
         this.§]"E§.objectLoaded();
         Model.popObject();
      }
      
      private function §;"D§(param1:Object) : void
      {
         var _loc2_:IGameObject = spaceRegistry.getSpace(Long.getLong(884380667,214)).createObject(§,#D§.§return set extends§(),this.§^#4§,"BonusObject");
         Model.object = _loc2_;
         this.§with package if§.putInitParams(new BonusImageCC(param1.image));
         this.§import catch while§.putInitParams(new BonusInfoCC(param1.bottomText,null,param1.topText));
         this.§with package if§.objectLoadedPost();
         Model.popObject();
      }
   }
}

