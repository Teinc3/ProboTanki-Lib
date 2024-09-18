package scpacker.utils
{
   import Renamed136.Renamed663;
   import Renamed194.Renamed5918;
   import Renamed232.Renamed1582;
   import Renamed602.Renamed603;
   import Renamed1614.Renamed1615;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.models.battle.battlefield.Renamed2395;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class Renamed5340
   {
      public function Renamed5340()
      {
         super();
      }
      
      public static function Renamed5367(param1:String) : Renamed663
      {
         switch(param1.toLowerCase())
         {
            case "blue":
               return Renamed663.BLUE;
            case "red":
               return Renamed663.RED;
            default:
               return Renamed663.NONE;
         }
      }
      
      public static function Renamed10782(param1:String) : CaptchaLocation
      {
         switch(param1)
         {
            case "REGISTER_FORM":
               return CaptchaLocation.REGISTER_FORM;
            case "LOGIN_FORM":
               return CaptchaLocation.LOGIN_FORM;
            default:
               return CaptchaLocation.REGISTER_FORM;
         }
      }
      
      public static function Renamed9654(param1:String) : Renamed1620
      {
         switch(param1)
         {
            case "NONE":
               return Renamed1620.NONE;
            case "LOW":
               return Renamed1620.LOW;
            case "HIGH":
               return Renamed1620.HIGH;
            default:
               return Renamed1620.NONE;
         }
      }
      
      public static function Renamed7638(param1:String) : Renamed1582
      {
         switch(param1)
         {
            case "NONE":
               return Renamed1582.NONE;
            case "HORNET_RAILGUN":
               return Renamed1582.HORNET_RAILGUN;
            case "WASP_RAILGUN":
               return Renamed1582.WASP_RAILGUN;
            case "HORNET_WASP_RAILGUN":
               return Renamed1582.HORNET_WASP_RAILGUN;
            default:
               return Renamed1582.NONE;
         }
      }
      
      public static function Renamed6898(param1:String) : Renamed1587
      {
         switch(param1)
         {
            case "DM":
               return Renamed1587.DM;
            case "TDM":
               return Renamed1587.TDM;
            case "CTF":
               return Renamed1587.CTF;
            case "CP":
               return Renamed1587.CP;
            case "AS":
               return Renamed1587.AS;
            default:
               return Renamed1587.DM;
         }
      }
      
      public static function Renamed1596(param1:String) : Renamed1615
      {
         switch(param1)
         {
            case "SUMMER":
               return Renamed1615.SUMMER;
            case "WINTER":
               return Renamed1615.WINTER;
            case "SPACE":
               return Renamed1615.SPACE;
            case "SUMMER_DAY":
               return Renamed1615.SUMMER_DAY;
            case "SUMMER_NIGHT":
               return Renamed1615.SUMMER_NIGHT;
            case "WINTER_DAY":
               return Renamed1615.WINTER_DAY;
            case "WINTER_NIGHT":
               return Renamed1615.WINTER_NIGHT;
            default:
               return Renamed1615.SUMMER;
         }
      }
      
      public static function Renamed5607(param1:String) : ItemGarageProperty
      {
         var _loc2_:ItemGarageProperty = null;
         for each(_loc2_ in ItemGarageProperty.values)
         {
            if(_loc2_.name.indexOf(param1) >= 0)
            {
               return _loc2_;
            }
         }
         return ItemGarageProperty.RICOCHET_RESISTANCE;
      }
      
      public static function Renamed5608(param1:String) : ItemProperty
      {
         var _loc2_:ItemProperty = null;
         for each(_loc2_ in ItemProperty.values)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return ItemProperty.RICOCHET_RESISTANCE;
      }
      
      public static function Renamed5610(param1:String) : ItemViewCategoryEnum
      {
         switch(param1.toLowerCase())
         {
            case "weapon":
               return ItemViewCategoryEnum.WEAPON;
            case "armor":
               return ItemViewCategoryEnum.ARMOR;
            case "paint":
               return ItemViewCategoryEnum.PAINT;
            case "inventory":
               return ItemViewCategoryEnum.INVENTORY;
            case "kit":
               return ItemViewCategoryEnum.KIT;
            case "special":
               return ItemViewCategoryEnum.SPECIAL;
            case "given_presents":
               return ItemViewCategoryEnum.GIVEN_PRESENTS;
            default:
               return null;
         }
      }
      
      public static function Renamed5609(param1:int) : ItemCategoryEnum
      {
         switch(param1)
         {
            case 2:
               return ItemCategoryEnum.ARMOR;
            case 1:
               return ItemCategoryEnum.WEAPON;
            case 3:
               return ItemCategoryEnum.COLOR;
            case 4:
               return ItemCategoryEnum.INVENTORY;
            case 5:
               return ItemCategoryEnum.PLUGIN;
            case 6:
               return ItemCategoryEnum.KIT;
            case 7:
               return ItemCategoryEnum.PRESENT;
            case 8:
               return ItemCategoryEnum.EMBLEM;
            case 9:
               return ItemCategoryEnum.GIVEN_PRESENT;
            default:
               return null;
         }
      }
      
      public static function Renamed10783(param1:String) : Renamed5918
      {
         switch(param1)
         {
            case "NORMAL":
               return Renamed5918.NORMAL;
            case "CRITICAL":
               return Renamed5918.CRITICAL;
            case "FATAL":
               return Renamed5918.FATAL;
            case "HEAL":
               return Renamed5918.HEAL;
            default:
               return Renamed5918.NORMAL;
         }
      }
      
      public static function Renamed677(param1:Object) : Renamed603
      {
         return new Renamed603(param1.x,param1.y,param1.z);
      }
      
      public static function Renamed5366(param1:String) : Renamed841
      {
         switch(param1)
         {
            case "newcome":
               return Renamed841.Renamed1114;
            case "active":
               return Renamed841.Renamed854;
            case "suicide":
               return Renamed841.DEAD;
            default:
               return Renamed841.DEAD;
         }
      }
      
      public static function Renamed9710(param1:Renamed1587) : Renamed2395
      {
         switch(param1)
         {
            case Renamed1587.CP:
               return Renamed2395.Renamed2396;
            case Renamed1587.CTF:
               return Renamed2395.CTF;
            case Renamed1587.DM:
               return Renamed2395.DM;
            case Renamed1587.TDM:
               return Renamed2395.TDM;
            case Renamed1587.AS:
               return Renamed2395.AS;
            default:
               return Renamed2395.DM;
         }
      }
   }
}

