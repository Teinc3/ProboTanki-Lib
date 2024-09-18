package Renamed4312
{
   import Renamed190.Renamed5564;
   import Renamed2090.Renamed4772;
   import Renamed2090.Renamed4773;
   import Renamed305.Renamed4775;
   import Renamed4776.Renamed5565;
   import alternativa.model.description.DescriptionModel;
   import alternativa.model.timeperiod.TimePeriodModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.garage.GarageModel;
   import alternativa.tanks.model.item.buyable.BuyableModel;
   import alternativa.tanks.model.item.category.ItemCategoryModel;
   import alternativa.tanks.model.item.category.ItemViewCategoryModel;
   import alternativa.tanks.model.item.countable.CountableItemModel;
   import alternativa.tanks.model.item.discount.DiscountCollectorModel;
   import alternativa.tanks.model.item.discount.DiscountModel;
   import alternativa.tanks.model.item.item.ItemModel;
   import alternativa.tanks.model.item.kit.Renamed2140;
   import alternativa.tanks.model.item.modification.ModificationModel;
   import alternativa.tanks.model.item.present.PresentItemModel;
   import alternativa.tanks.model.item.properties.ItemPropertiesModel;
   import alternativa.tanks.model.item.temporary.TemporaryItemModel;
   import alternativa.tanks.model.item.upgradable.UpgradableParamsModel;
   import alternativa.tanks.model.item3d.Item3DModel;
   import alternativa.tanks.model.presents.NewPresentsShowingModel;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.types.Long;
   import Renamed347.Renamed5566;
   import Renamed378.Renamed4779;
   import Renamed385.Renamed4886;
   import Renamed407.Renamed4782;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import platform.client.models.commons.description.DescriptionModelCC;
   import platform.client.models.commons.periodtime.TimePeriodModelCC;
   import projects.tanks.client.commons.models.coloring.ColoringCC;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.garage.GarageModelCC;
   import projects.tanks.client.garage.models.item.buyable.BuyableCC;
   import projects.tanks.client.garage.models.item.category.ItemCategoryCC;
   import projects.tanks.client.garage.models.item.countable.CountableItemCC;
   import projects.tanks.client.garage.models.item.discount.DiscountCC;
   import projects.tanks.client.garage.models.item.item.ItemModelCC;
   import projects.tanks.client.garage.models.item.item3d.Item3DCC;
   import projects.tanks.client.garage.models.item.kit.Renamed4317;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.client.garage.models.item.modification.ModificationCC;
   import projects.tanks.client.garage.models.item.object3ds.Object3DSCC;
   import projects.tanks.client.garage.models.item.present.PresentItemCC;
   import projects.tanks.client.garage.models.item.properties.ItemGaragePropertyData;
   import projects.tanks.client.garage.models.item.properties.ItemPropertiesCC;
   import projects.tanks.client.garage.models.item.temporary.TemporaryItemCC;
   import projects.tanks.client.garage.models.item.upgradeable.UpgradableParamsCC;
   import projects.tanks.client.garage.models.item.upgradeable.calculators.LinearParams;
   import projects.tanks.client.garage.models.item.upgradeable.types.GaragePropertyData;
   import projects.tanks.client.garage.models.item.upgradeable.types.PropertyData;
   import projects.tanks.client.garage.models.item.view.ItemViewCategoryCC;
   import projects.tanks.clients.flash.commons.models.coloring.ColoringModel;
   import projects.tanks.clients.flash.resources.object3ds.Object3DSModel;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.utils.Renamed5340;
   import Renamed426.Renamed4788;
   import Renamed433.Renamed3666;
   import Renamed437.Renamed4790;
   
   public class Renamed5567 extends Renamed4886
   {
      private var Renamed5568:GarageModel;
      
      private var Renamed5569:ItemModel;
      
      private var Renamed5570:ItemCategoryModel;
      
      private var Renamed5571:ItemViewCategoryModel;
      
      private var Renamed5572:DescriptionModel;
      
      private var Renamed5573:BuyableModel;
      
      private var Renamed5574:ModificationModel;
      
      private var Renamed5575:ItemPropertiesModel;
      
      private var Renamed5576:UpgradableParamsModel;
      
      private var Renamed5577:CountableItemModel;
      
      private var Renamed5344:Object3DSModel;
      
      private var Renamed5343:ColoringModel;
      
      private var Renamed5578:TemporaryItemModel;
      
      private var Renamed5579:DiscountModel;
      
      private var Renamed5580:DiscountCollectorModel;
      
      private var Renamed5581:Renamed2140;
      
      private var Renamed5582:TimePeriodModel;
      
      private var Renamed5583:Renamed4790;
      
      private var Renamed5584:Renamed4773;
      
      private var Renamed5585:Renamed4772;
      
      private var Renamed5586:PresentItemModel;
      
      private var Renamed5587:Renamed4775;
      
      private var Renamed5588:Item3DModel;
      
      private var Renamed5589:NewPresentsShowingModel;
      
      private var Renamed5590:Renamed4782;
      
      private var Renamed5591:Renamed4779;
      
      private var Renamed5592:Renamed4788;
      
      private var achievementService:IAchievementService;
      
      private var gameClass:IGameClass;
      
      private var Renamed5593:IGameClass;
      
      private var Renamed5594:ISpace;
      
      private var garageObject:IGameObject;
      
      public var modelId:int;
      
      public function Renamed5567()
      {
         super();
         this.modelId = 34;
         this.Renamed5568 = GarageModel(modelRegistry.getModel(Long.getLong(0,300040010)));
         this.Renamed5569 = ItemModel(modelRegistry.getModel(Long.getLong(800589377,840038407)));
         this.Renamed5570 = ItemCategoryModel(modelRegistry.getModel(Long.getLong(492245786,-1837686060)));
         this.Renamed5571 = ItemViewCategoryModel(modelRegistry.getModel(Long.getLong(1424296501,-807048170)));
         this.Renamed5572 = DescriptionModel(modelRegistry.getModel(Long.getLong(916213531,-841295065)));
         this.Renamed5573 = BuyableModel(modelRegistry.getModel(Long.getLong(644770553,-155779331)));
         this.Renamed5574 = ModificationModel(modelRegistry.getModel(Long.getLong(580825858,-1941731225)));
         this.Renamed5575 = ItemPropertiesModel(modelRegistry.getModel(Long.getLong(0,300040017)));
         this.Renamed5576 = UpgradableParamsModel(modelRegistry.getModel(Long.getLong(0,300040029)));
         this.Renamed5577 = CountableItemModel(modelRegistry.getModel(Long.getLong(0,300040004)));
         this.Renamed5344 = Object3DSModel(modelRegistry.getModel(Long.getLong(1497301838,-1092921347)));
         this.Renamed5343 = ColoringModel(modelRegistry.getModel(Long.getLong(947299051,-358915161)));
         this.Renamed5578 = TemporaryItemModel(modelRegistry.getModel(Long.getLong(0,300040023)));
         this.Renamed5579 = DiscountModel(modelRegistry.getModel(Long.getLong(687238537,2002147897)));
         this.Renamed5580 = DiscountCollectorModel(modelRegistry.getModel(Long.getLong(1896140971,-1323660734)));
         this.Renamed5581 = Renamed2140(modelRegistry.getModel(Long.getLong(1215266592,-1320571870)));
         this.Renamed5582 = TimePeriodModel(modelRegistry.getModel(Long.getLong(1870140649,1080360405)));
         this.Renamed5583 = Renamed4790(modelRegistry.getModel(Long.getLong(882584998,678334280)));
         this.Renamed5584 = Renamed4773(modelRegistry.getModel(Long.getLong(1891481944,-1293130596)));
         this.Renamed5585 = Renamed4772(modelRegistry.getModel(Long.getLong(888433053,2115284408)));
         this.Renamed5586 = PresentItemModel(modelRegistry.getModel(Long.getLong(253893103,1551357114)));
         this.Renamed5587 = Renamed4775(modelRegistry.getModel(Long.getLong(0,300040005)));
         this.Renamed5588 = Item3DModel(modelRegistry.getModel(Long.getLong(0,300040012)));
         this.Renamed5589 = NewPresentsShowingModel(modelRegistry.getModel(Long.getLong(1012007416,-1351622809)));
         this.Renamed5590 = Renamed4782(modelRegistry.getModel(Long.getLong(0,300040011)));
         this.Renamed5591 = Renamed4779(modelRegistry.getModel(Long.getLong(253893127,1551357191)));
         this.Renamed5592 = Renamed4788(modelRegistry.getModel(Long.getLong(841189855,-1268110049)));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         var _loc2_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(this.Renamed5569.id);
         _loc1_.push(this.Renamed5571.id);
         _loc1_.push(this.Renamed5570.id);
         _loc1_.push(this.Renamed5572.id);
         _loc1_.push(this.Renamed5573.id);
         _loc1_.push(this.Renamed5574.id);
         _loc1_.push(this.Renamed5575.id);
         _loc1_.push(this.Renamed5576.id);
         _loc1_.push(this.Renamed5577.id);
         _loc1_.push(this.Renamed5344.id);
         _loc1_.push(this.Renamed5343.id);
         _loc1_.push(this.Renamed5578.id);
         _loc1_.push(this.Renamed5579.id);
         _loc1_.push(this.Renamed5580.id);
         _loc1_.push(this.Renamed5581.id);
         _loc1_.push(this.Renamed5582.id);
         _loc1_.push(this.Renamed5583.id);
         _loc1_.push(this.Renamed5568.id);
         _loc1_.push(this.Renamed5584.id);
         _loc1_.push(this.Renamed5585.id);
         _loc1_.push(this.Renamed5586.id);
         _loc1_.push(this.Renamed5587.id);
         _loc1_.push(this.Renamed5590.id);
         _loc1_.push(this.Renamed5591.id);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc2_.push(_loc1_[_loc3_]);
            _loc3_++;
         }
         this.gameClass = gameTypeRegistry.createClass(Long.getLong(15025,684360),_loc1_);
         _loc2_.push(this.Renamed5592.id);
         this.Renamed5593 = gameTypeRegistry.createClass(Long.getLong(15026,684361),_loc2_);
         this.Renamed5594 = ISpace(spaceRegistry.getSpace(Long.getLong(884380667,214)));
         this.achievementService = IAchievementService(OSGi.getInstance().getService(IAchievementService));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed5595.Renamed5596:
               this.initDepot(param1);
               break;
            case Renamed5595.Renamed5597:
               this.initMarket(param1);
               break;
            case Renamed5595.Renamed5364:
               this.Renamed5365();
               break;
            case Renamed5595.Renamed5598:
               this.initMounted(param1);
               break;
            case Renamed5595.Renamed5599:
               this.Renamed5600();
               break;
            case Renamed5595.Renamed5601:
               this.Renamed5602(param1);
               break;
            case Renamed5595.Renamed5603:
               this.selectFirstItemInDepot();
               break;
            case Renamed5595.Renamed5604:
               this.select(param1);
               break;
            case Renamed5595.Renamed5605:
               this.showCategory(param1);
               break;
            case Renamed5595.Renamed5606:
               this.showAlert();
         }
      }
      
      private function initDepot(param1:Object) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Vector.<ItemGaragePropertyData> = null;
         var _loc7_:Vector.<GaragePropertyData> = null;
         var _loc8_:Vector.<PropertyData> = null;
         var _loc9_:Object = null;
         var _loc10_:int = 0;
         var _loc11_:IGameObject = null;
         var _loc12_:Vector.<PropertyData> = null;
         var _loc13_:* = undefined;
         var _loc2_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc3_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc4_:Object = JSON.parse(param1.json);
         for each(_loc5_ in _loc4_.items)
         {
            _loc6_ = new Vector.<ItemGaragePropertyData>();
            _loc7_ = new Vector.<GaragePropertyData>();
            _loc8_ = new Vector.<PropertyData>();
            for each(_loc9_ in _loc5_.properts)
            {
               _loc12_ = new Vector.<PropertyData>();
               _loc6_.push(new ItemGaragePropertyData(Renamed5340.Renamed5607(_loc9_.property),_loc9_.value));
               if(_loc9_.subproperties != null)
               {
                  for each(_loc13_ in _loc9_.subproperties)
                  {
                     _loc12_.push(new PropertyData(_loc13_.value,_loc13_.value,Renamed5340.Renamed5608(_loc13_.property)));
                  }
               }
               else
               {
                  _loc12_.push(new PropertyData(_loc9_.value,_loc9_.value,Renamed5340.Renamed5608(_loc9_.property)));
               }
               _loc7_.push(new GaragePropertyData(new LinearParams(_loc9_.value,_loc9_.value),0,0,25,_loc12_,Renamed5340.Renamed5607(_loc9_.property),0,0,new LinearParams(_loc9_.value,_loc9_.value)));
            }
            _loc10_ = int(_loc5_.modificationID);
            _loc11_ = this.Renamed5594.createObject(Long.getLong(0,Renamed5340.Renamed5609(_loc5_.type) == ItemCategoryEnum.GIVEN_PRESENT ? int(_loc5_.present.date + _loc5_.previewResourceId) : int(_loc5_.previewResourceId)),this.gameClass,_loc5_.id + "_m" + _loc10_);
            Model.object = _loc11_;
            this.Renamed5569.putInitParams(new ItemModelCC(30,_loc5_.rank,_loc5_.index,ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc5_.previewResourceId)))));
            this.Renamed5571.putInitParams(new ItemViewCategoryCC(Renamed5340.Renamed5610(_loc5_.category)));
            this.Renamed5570.putInitParams(new ItemCategoryCC(Renamed5340.Renamed5609(_loc5_.type)));
            this.Renamed5572.putInitParams(new DescriptionModelCC(_loc5_.description,_loc5_.name));
            this.Renamed5573.putInitParams(new BuyableCC(true,_loc5_.price));
            this.Renamed5574.putInitParams(new ModificationCC(Long.getLong(0,_loc5_.baseItemId),_loc5_.modificationID == null ? -1 : int(_loc5_.modificationID)));
            this.Renamed5575.putInitParams(new ItemPropertiesCC(_loc6_));
            this.Renamed5576.putInitParams(new UpgradableParamsCC(null,_loc7_));
            this.Renamed5577.putInitParams(new CountableItemCC(_loc5_.count == null ? -1 : int(_loc5_.count)));
            this.Renamed5344.putInitParams(new Object3DSCC(Long.getLong(0,_loc5_.object3ds)));
            this.Renamed5343.putInitParams(new ColoringCC(null,ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc5_.coloring)))));
            this.Renamed5578.putInitParams(new TemporaryItemCC(0,_loc5_.remainingTimeInSec));
            this.Renamed5579.putInitParams(new DiscountCC(_loc5_.discount.percent,_loc5_.discount.timeLeftInSeconds,0));
            if(Renamed5340.Renamed5609(_loc5_.type) == ItemCategoryEnum.GIVEN_PRESENT)
            {
               this.Renamed5586.putInitParams(new PresentItemCC(_loc5_.present.date,ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc5_.present.image))),_loc5_.present.presenter,_loc5_.present.text,_loc5_.present.presentId));
            }
            this.Renamed5591.putInitParams(new Renamed5565(_loc5_.isForRent));
            this.Renamed5579.objectLoadedPost();
            this.Renamed5577.objectLoaded();
            this.Renamed5578.objectLoaded();
            this.Renamed5576.objectLoadedPost();
            Model.popObject();
            if(Renamed5340.Renamed5609(_loc5_.type) == ItemCategoryEnum.GIVEN_PRESENT)
            {
               _loc3_.push(_loc11_);
            }
            else
            {
               _loc2_.push(_loc11_);
            }
         }
         this.Renamed5568.putInitParams(new GarageModelCC(Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.garageBoxId)))));
         this.Renamed5568.objectLoaded();
         this.Renamed5568.initDepot(_loc2_);
         this.Renamed5568.Renamed2108(_loc3_);
      }
      
      private function initMarket(param1:Object) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Vector.<ItemGaragePropertyData> = null;
         var _loc6_:Vector.<GaragePropertyData> = null;
         var _loc7_:Vector.<PropertyData> = null;
         var _loc8_:Vector.<KitItem> = null;
         var _loc9_:Object = null;
         var _loc10_:IGameObject = null;
         var _loc11_:* = undefined;
         var _loc12_:Vector.<PropertyData> = null;
         var _loc13_:* = undefined;
         var _loc2_:Object = JSON.parse(param1.json);
         var _loc3_:Vector.<IGameObject> = new Vector.<IGameObject>();
         for each(_loc4_ in _loc2_.items)
         {
            _loc5_ = new Vector.<ItemGaragePropertyData>();
            _loc6_ = new Vector.<GaragePropertyData>();
            _loc7_ = new Vector.<PropertyData>();
            _loc8_ = new Vector.<KitItem>();
            if(Renamed5340.Renamed5609(_loc4_.type) == ItemCategoryEnum.KIT)
            {
               for each(_loc11_ in _loc4_.kit.kitItems)
               {
                  _loc8_.push(new KitItem(_loc11_.count,this.Renamed5594.getObjectByName(_loc11_.id),false));
               }
            }
            for each(_loc9_ in _loc4_.properts)
            {
               _loc12_ = new Vector.<PropertyData>();
               _loc5_.push(new ItemGaragePropertyData(Renamed5340.Renamed5607(_loc9_.property),_loc9_.value));
               if(_loc9_.subproperties != null)
               {
                  for each(_loc13_ in _loc9_.subproperties)
                  {
                     _loc12_.push(new PropertyData(_loc13_.value,_loc13_.value,Renamed5340.Renamed5608(_loc13_.property)));
                  }
               }
               else
               {
                  _loc12_.push(new PropertyData(_loc9_.value,_loc9_.value,Renamed5340.Renamed5608(_loc9_.property)));
               }
               _loc6_.push(new GaragePropertyData(new LinearParams(_loc9_.value,_loc9_.value),0,0,25,_loc12_,Renamed5340.Renamed5607(_loc9_.property),0,0,new LinearParams(_loc9_.value,_loc9_.value)));
            }
            _loc10_ = this.Renamed5594.createObject(Long.getLong(0,_loc4_.previewResourceId),_loc4_.id == "rename" ? this.Renamed5593 : this.gameClass,_loc4_.id + "_m" + (_loc4_.modificationID == undefined ? "0" : _loc4_.modificationID));
            Model.object = _loc10_;
            this.Renamed5569.putInitParams(new ItemModelCC(30,_loc4_.rank,_loc4_.index,ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.previewResourceId)))));
            this.Renamed5571.putInitParams(new ItemViewCategoryCC(Renamed5340.Renamed5610(_loc4_.category)));
            this.Renamed5570.putInitParams(new ItemCategoryCC(Renamed5340.Renamed5609(_loc4_.type)));
            this.Renamed5572.putInitParams(new DescriptionModelCC(_loc4_.description,_loc4_.name));
            this.Renamed5573.putInitParams(new BuyableCC(true,_loc4_.price));
            this.Renamed5574.putInitParams(new ModificationCC(Long.getLong(0,_loc4_.baseItemId),_loc4_.modificationID == null ? -1 : int(_loc4_.modificationID)));
            this.Renamed5575.putInitParams(new ItemPropertiesCC(_loc5_));
            this.Renamed5576.putInitParams(new UpgradableParamsCC(null,_loc6_));
            this.Renamed5577.putInitParams(new CountableItemCC(Renamed5340.Renamed5609(_loc4_.type) == ItemCategoryEnum.INVENTORY ? 0 : -1));
            this.Renamed5344.putInitParams(new Object3DSCC(Long.getLong(0,_loc4_.object3ds)));
            this.Renamed5343.putInitParams(new ColoringCC(null,ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.coloring)))));
            this.Renamed5578.putInitParams(new TemporaryItemCC(_loc4_.remainingTimeInSec,_loc4_.remainingTimeInSec));
            this.Renamed5579.putInitParams(new DiscountCC(_loc4_.discount.percent,_loc4_.discount.timeLeftInSeconds,_loc4_.discount.timeToStartInSeconds));
            this.Renamed5590.putInitParams(new Renamed5564(_loc4_.grouped));
            this.Renamed5591.putInitParams(new Renamed5565(_loc4_.isForRent));
            this.Renamed5579.objectLoadedPost();
            if(_loc4_.id == "rename")
            {
               this.Renamed5592.objectLoaded();
            }
            if(Renamed5340.Renamed5609(_loc4_.type) == ItemCategoryEnum.KIT)
            {
               this.Renamed5581.putInitParams(new Renamed4317(_loc4_.kit.discountInPercent,ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.kit.image))),_loc8_));
               this.Renamed5582.putInitParams(new TimePeriodModelCC(true,_loc4_.kit.isTimeless,_loc4_.kit.timeLeftInSeconds,10));
               this.Renamed5582.objectLoaded();
            }
            this.Renamed5577.objectLoaded();
            this.Renamed5576.objectLoadedPost();
            _loc3_.push(_loc10_);
            Model.popObject();
         }
         Model.object = this.garageObject = this.Renamed5594.createObject(Renamed5566.Renamed5611(),this.gameClass,"garageObject");
         this.Renamed5587.putInitParams(new Renamed3666(_loc2_.delayMountArmorInSec,_loc2_.delayMountColorInSec,_loc2_.delayMountWeaponInSec));
         this.Renamed5587.objectLoadedPost();
         this.Renamed5568.initMarket(_loc3_);
         this.Renamed5568.selectFirstItemInDepot();
         this.achievementService.setPanelPartition(1);
         Model.popObject();
      }
      
      private function Renamed5365() : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = null;
         this.Renamed5568.objectUnloaded();
         var _loc1_:Vector.<IGameObject> = new Vector.<IGameObject>();
         for each(_loc2_ in this.Renamed5594.objects)
         {
            _loc1_.push(_loc2_);
         }
         for each(_loc3_ in _loc1_)
         {
            this.Renamed5594.destroyObject(_loc3_.id);
         }
         this.Renamed5594.destroyObject(this.garageObject.id);
      }
      
      private function initMounted(param1:Object) : void
      {
         var _loc2_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc3_:IGameObject = this.Renamed5594.getObjectByName(param1.itemId);
         _loc2_.push(_loc3_);
         Model.object = _loc3_;
         this.Renamed5588.putInitParams(new Item3DCC(param1.mounted));
         this.Renamed5588.objectLoaded();
         Model.popObject();
         if(param1.mounted)
         {
            this.Renamed5568.initMounted(_loc2_);
         }
      }
      
      private function Renamed5600() : void
      {
         this.Renamed5592.Renamed5600();
      }
      
      private function Renamed5602(param1:Object) : void
      {
         this.Renamed5592.Renamed5602(param1.oldName,param1.newName);
      }
      
      private function selectFirstItemInDepot() : void
      {
         this.Renamed5568.selectFirstItemInDepot();
      }
      
      private function select(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed5594.getObjectByName(param1.itemId);
         this.Renamed5568.select(_loc2_);
      }
      
      private function showCategory(param1:Object) : void
      {
         this.Renamed5568.showCategory(Renamed5340.Renamed5610(param1.category));
      }
      
      private function showAlert() : void
      {
         this.Renamed5589.showAlert();
      }
   }
}

