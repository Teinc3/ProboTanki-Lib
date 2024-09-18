package projects.tanks.clients.flash.commons.services.timeunit
{
   import alternativa.osgi.service.locale.ILocaleService;
   
   public class §throw catch else§ implements ITimeUnitService
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function §throw catch else§()
      {
         super();
      }
      
      private static function §>"q§(param1:int, param2:int, param3:int) : §do for for§
      {
         var _loc4_:§do for for§ = new §do for for§();
         param3 %= 100;
         if(param3 >= 11 && param3 <= 19)
         {
            _loc4_.§;!X§ = "дней";
         }
         else
         {
            param3 %= 10;
            if(param3 == 1)
            {
               _loc4_.§;!X§ = "день";
            }
            else if(param3 >= 2 && param3 <= 4)
            {
               _loc4_.§;!X§ = "дня";
            }
            else
            {
               _loc4_.§;!X§ = "дней";
            }
         }
         if(param2 == 1 || param2 == 21)
         {
            _loc4_.§0T§ = "час";
         }
         else if(param2 >= 2 && param2 <= 4 || param2 >= 22 && param2 <= 24)
         {
            _loc4_.§0T§ = "часа";
         }
         else if(param2 >= 5 && param2 <= 20)
         {
            _loc4_.§0T§ = "часов";
         }
         if(param1 == 0 || param1 == 1 || param1 == 21 || param1 == 31 || param1 == 41 || param1 == 51)
         {
            _loc4_.§dynamic each§ = "минуту";
         }
         else if(param1 >= 2 && param1 <= 4 || param1 >= 22 && param1 <= 24 || param1 >= 32 && param1 <= 34 || param1 >= 42 && param1 <= 44 || param1 >= 52 && param1 <= 54)
         {
            _loc4_.§dynamic each§ = "минуты";
         }
         else if(param1 >= 5 && param1 <= 20 || param1 >= 25 && param1 <= 30 || param1 >= 35 && param1 <= 40 || param1 >= 45 && param1 <= 50 || param1 >= 55 && param1 <= 60)
         {
            _loc4_.§dynamic each§ = "минут";
         }
         return _loc4_;
      }
      
      private static function §;#m§(param1:int, param2:int, param3:int) : §do for for§
      {
         var _loc4_:§do for for§ = new §do for for§();
         if(param3 == 1)
         {
            _loc4_.§;!X§ = "day";
         }
         else
         {
            _loc4_.§;!X§ = "days";
         }
         if(param2 == 1)
         {
            _loc4_.§0T§ = "hour";
         }
         else
         {
            _loc4_.§0T§ = "hours";
         }
         if(param1 == 1 || param1 == 0)
         {
            _loc4_.§dynamic each§ = "minute";
         }
         else
         {
            _loc4_.§dynamic each§ = "minutes";
         }
         return _loc4_;
      }
      
      private static function §&"n§(param1:int, param2:int, param3:int) : §do for for§
      {
         var _loc4_:§do for for§ = new §do for for§();
         if(param3 == 1)
         {
            _loc4_.§;!X§ = "Tag";
         }
         else
         {
            _loc4_.§;!X§ = "Tage";
         }
         if(param2 == 1)
         {
            _loc4_.§0T§ = "Stunde";
         }
         else
         {
            _loc4_.§0T§ = "Stunden";
         }
         if(param1 == 1 || param1 == 0)
         {
            _loc4_.§dynamic each§ = "Minute";
         }
         else
         {
            _loc4_.§dynamic each§ = "Minuten";
         }
         return _loc4_;
      }
      
      private static function §extends catch throw§(param1:int, param2:int, param3:int) : §do for for§
      {
         var _loc4_:§do for for§ = new §do for for§();
         if(param3 == 1)
         {
            _loc4_.§;!X§ = "dia";
         }
         else
         {
            _loc4_.§;!X§ = "dias";
         }
         if(param2 == 1)
         {
            _loc4_.§0T§ = "hora";
         }
         else
         {
            _loc4_.§0T§ = "horas";
         }
         if(param1 == 1 || param1 == 0)
         {
            _loc4_.§dynamic each§ = "minuto";
         }
         else
         {
            _loc4_.§dynamic each§ = "minutos";
         }
         return _loc4_;
      }
      
      private static function §="<§(param1:int, param2:int, param3:int) : §do for for§
      {
         var _loc4_:§do for for§ = new §do for for§();
         if(param3 == 1)
         {
            _loc4_.§;!X§ = "día";
         }
         else
         {
            _loc4_.§;!X§ = "días";
         }
         if(param2 == 1)
         {
            _loc4_.§0T§ = "hora";
         }
         else
         {
            _loc4_.§0T§ = "horas";
         }
         if(param1 == 1 || param1 == 0)
         {
            _loc4_.§dynamic each§ = "minuto";
         }
         else
         {
            _loc4_.§dynamic each§ = "minutos";
         }
         return _loc4_;
      }
      
      private static function §in for with§() : §do for for§
      {
         var _loc1_:§do for for§ = new §do for for§();
         _loc1_.§;!X§ = "天";
         _loc1_.§0T§ = "小时";
         _loc1_.§dynamic each§ = "分鐘";
         return _loc1_;
      }
      
      private static function §%![§(param1:int, param2:int, param3:int) : §do for for§
      {
         var _loc4_:§do for for§ = new §do for for§();
         if(param3 == 1)
         {
            _loc4_.§;!X§ = "dzień";
         }
         else
         {
            _loc4_.§;!X§ = "dni";
         }
         if(param2 == 1)
         {
            _loc4_.§0T§ = "godzina";
         }
         else
         {
            _loc4_.§0T§ = "godzin";
         }
         if(param1 == 0)
         {
            _loc4_.§dynamic each§ = "minut";
         }
         else if(param1 == 1)
         {
            _loc4_.§dynamic each§ = "minuta";
         }
         else if(param1 >= 2 && param1 <= 4 || param1 >= 22 && param1 <= 24 || param1 >= 32 && param1 <= 34 || param1 >= 42 && param1 <= 44 || param1 >= 52 && param1 <= 54)
         {
            _loc4_.§dynamic each§ = "minuty";
         }
         else
         {
            _loc4_.§dynamic each§ = "minut";
         }
         return _loc4_;
      }
      
      private static function §throw catch catch§(param1:int, param2:int, param3:int) : §do for for§
      {
         var _loc4_:§do for for§ = new §do for for§();
         param3 %= 100;
         if(param3 >= 11 && param3 <= 19)
         {
            _loc4_.§;!X§ = "днів";
         }
         else
         {
            param3 %= 10;
            if(param3 == 1)
            {
               _loc4_.§;!X§ = "день";
            }
            else if(param3 >= 2 && param3 <= 4)
            {
               _loc4_.§;!X§ = "дня";
            }
            else
            {
               _loc4_.§;!X§ = "днів";
            }
         }
         if(param2 == 1 || param2 == 21)
         {
            _loc4_.§0T§ = "година";
         }
         else if(param2 >= 2 && param2 <= 4 || param2 >= 22 && param2 <= 24)
         {
            _loc4_.§0T§ = "години";
         }
         else if(param2 >= 5 && param2 <= 20)
         {
            _loc4_.§0T§ = "годин";
         }
         if(param1 == 0 || param1 == 1 || param1 == 21 || param1 == 31 || param1 == 41 || param1 == 51)
         {
            _loc4_.§dynamic each§ = "хвилину";
         }
         else if(param1 >= 2 && param1 <= 4 || param1 >= 22 && param1 <= 24 || param1 >= 32 && param1 <= 34 || param1 >= 42 && param1 <= 44 || param1 >= 52 && param1 <= 54)
         {
            _loc4_.§dynamic each§ = "хвилини";
         }
         else if(param1 >= 5 && param1 <= 20 || param1 >= 25 && param1 <= 30 || param1 >= 35 && param1 <= 40 || param1 >= 45 && param1 <= 50 || param1 >= 55 && param1 <= 60)
         {
            _loc4_.§dynamic each§ = "хвилин";
         }
         return _loc4_;
      }
      
      public function §&!1§(param1:int, param2:int, param3:int) : String
      {
         var _loc4_:String = "";
         var _loc5_:§do for for§ = this.§const const return§(param1,param2,param3);
         if(param3 == 0 && param2 == 0 && param1 == 0)
         {
            return "1 " + _loc5_.§dynamic each§;
         }
         if(param3 != 0)
         {
            _loc4_ = param3 + " " + _loc5_.§;!X§;
         }
         if(param2 != 0)
         {
            _loc4_ = _loc4_ + " " + param2 + " " + _loc5_.§0T§;
         }
         if(param1 != 0)
         {
            _loc4_ = _loc4_ + " " + param1 + " " + _loc5_.§dynamic each§;
         }
         return _loc4_;
      }
      
      public function §5!7§(param1:int) : String
      {
         return param1 + " " + this.§var for null§(param1);
      }
      
      public function §var for null§(param1:int) : String
      {
         return this.§const const return§(0,0,param1).§;!X§;
      }
      
      public function §const const return§(param1:int, param2:int, param3:int) : §do for for§
      {
         switch(localeService.language)
         {
            case "ru":
               return §>"q§(param1,param2,param3);
            case "de":
               return §&"n§(param1,param2,param3);
            case "pt_BR":
               return §extends catch throw§(param1,param2,param3);
            case "pl":
               return §%![§(param1,param2,param3);
            case "es":
               return §="<§(param1,param2,param3);
            case "cn":
               return §in for with§();
            case "ua":
               return §throw catch catch§(param1,param2,param3);
            case "en":
         }
         return §;#m§(param1,param2,param3);
      }
   }
}

