package scpacker.utils
{
   import § !g§.§class for case§;
   import §'!@§.§'"a§;
   import §1!R§.§throw package static§;
   import §;"?§.§#">§;
   import §?"a§.§finally for do§;
   import alternativa.tanks.battle.objects.tank.§continue var case§;
   import alternativa.tanks.models.battle.battlefield.§for catch while§;
   import projects.tanks.client.battleselect.model.item.§5!9§;
   import projects.tanks.client.battleservice.§final package import§;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class §throw package each§
   {
      public function §throw package each§()
      {
         super();
      }
      
      public static function §return package extends§(param1:String) : §class for case§
      {
         switch(param1.toLowerCase())
         {
            case "blue":
               return §class for case§.BLUE;
            case "red":
               return §class for case§.RED;
            default:
               return §class for case§.NONE;
         }
      }
      
      public static function § $%§(param1:String) : CaptchaLocation
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
      
      public static function §8!t§(param1:String) : §5!9§
      {
         switch(param1)
         {
            case "NONE":
               return §5!9§.NONE;
            case "LOW":
               return §5!9§.LOW;
            case "HIGH":
               return §5!9§.HIGH;
            default:
               return §5!9§.NONE;
         }
      }
      
      public static function §#! §(param1:String) : §throw package static§
      {
         switch(param1)
         {
            case "NONE":
               return §throw package static§.NONE;
            case "HORNET_RAILGUN":
               return §throw package static§.HORNET_RAILGUN;
            case "WASP_RAILGUN":
               return §throw package static§.WASP_RAILGUN;
            case "HORNET_WASP_RAILGUN":
               return §throw package static§.HORNET_WASP_RAILGUN;
            default:
               return §throw package static§.NONE;
         }
      }
      
      public static function §get true§(param1:String) : §final package import§
      {
         switch(param1)
         {
            case "DM":
               return §final package import§.DM;
            case "TDM":
               return §final package import§.TDM;
            case "CTF":
               return §final package import§.CTF;
            case "CP":
               return §final package import§.CP;
            case "AS":
               return §final package import§.AS;
            default:
               return §final package import§.DM;
         }
      }
      
      public static function §0"E§(param1:String) : §finally for do§
      {
         switch(param1)
         {
            case "SUMMER":
               return §finally for do§.SUMMER;
            case "WINTER":
               return §finally for do§.WINTER;
            case "SPACE":
               return §finally for do§.SPACE;
            case "SUMMER_DAY":
               return §finally for do§.SUMMER_DAY;
            case "SUMMER_NIGHT":
               return §finally for do§.SUMMER_NIGHT;
            case "WINTER_DAY":
               return §finally for do§.WINTER_DAY;
            case "WINTER_NIGHT":
               return §finally for do§.WINTER_NIGHT;
            default:
               return §finally for do§.SUMMER;
         }
      }
      
      public static function §8">§(param1:String) : ItemGarageProperty
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
      
      public static function §super catch with§(param1:String) : ItemProperty
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
      
      public static function §in package implements§(param1:String) : ItemViewCategoryEnum
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
      
      public static function §include var try§(param1:int) : ItemCategoryEnum
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
      
      public static function §each case§(param1:String) : §'"a§
      {
         switch(param1)
         {
            case "NORMAL":
               return §'"a§.NORMAL;
            case "CRITICAL":
               return §'"a§.CRITICAL;
            case "FATAL":
               return §'"a§.FATAL;
            case "HEAL":
               return §'"a§.HEAL;
            default:
               return §'"a§.NORMAL;
         }
      }
      
      public static function §,i§(param1:Object) : §#">§
      {
         return new §#">§(param1.x,param1.y,param1.z);
      }
      
      public static function §break set static§(param1:String) : §continue var case§
      {
         switch(param1)
         {
            case "newcome":
               return §continue var case§.§set for for§;
            case "active":
               return §continue var case§.§?!S§;
            case "suicide":
               return §continue var case§.DEAD;
            default:
               return §continue var case§.DEAD;
         }
      }
      
      public static function §function set var§(param1:§final package import§) : §for catch while§
      {
         switch(param1)
         {
            case §final package import§.CP:
               return §for catch while§.§static switch§;
            case §final package import§.CTF:
               return §for catch while§.CTF;
            case §final package import§.DM:
               return §for catch while§.DM;
            case §final package import§.TDM:
               return §for catch while§.TDM;
            case §final package import§.AS:
               return §for catch while§.AS;
            default:
               return §for catch while§.DM;
         }
      }
   }
}

