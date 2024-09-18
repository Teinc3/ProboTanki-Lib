package projects.tanks.clients.flash.commons.services.timeunit
{
   import alternativa.osgi.service.locale.ILocaleService;
   
   public class Renamed4454 implements ITimeUnitService
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function Renamed4454()
      {
         super();
      }
      
      private static function Renamed4463(param1:int, param2:int, param3:int) : Renamed4459
      {
         var _loc4_:Renamed4459 = new Renamed4459();
         param3 %= 100;
         if(param3 >= 11 && param3 <= 19)
         {
            _loc4_.Renamed4460 = "дней";
         }
         else
         {
            param3 %= 10;
            if(param3 == 1)
            {
               _loc4_.Renamed4460 = "день";
            }
            else if(param3 >= 2 && param3 <= 4)
            {
               _loc4_.Renamed4460 = "дня";
            }
            else
            {
               _loc4_.Renamed4460 = "дней";
            }
         }
         if(param2 == 1 || param2 == 21)
         {
            _loc4_.Renamed4461 = "час";
         }
         else if(param2 >= 2 && param2 <= 4 || param2 >= 22 && param2 <= 24)
         {
            _loc4_.Renamed4461 = "часа";
         }
         else if(param2 >= 5 && param2 <= 20)
         {
            _loc4_.Renamed4461 = "часов";
         }
         if(param1 == 0 || param1 == 1 || param1 == 21 || param1 == 31 || param1 == 41 || param1 == 51)
         {
            _loc4_.Renamed4462 = "минуту";
         }
         else if(param1 >= 2 && param1 <= 4 || param1 >= 22 && param1 <= 24 || param1 >= 32 && param1 <= 34 || param1 >= 42 && param1 <= 44 || param1 >= 52 && param1 <= 54)
         {
            _loc4_.Renamed4462 = "минуты";
         }
         else if(param1 >= 5 && param1 <= 20 || param1 >= 25 && param1 <= 30 || param1 >= 35 && param1 <= 40 || param1 >= 45 && param1 <= 50 || param1 >= 55 && param1 <= 60)
         {
            _loc4_.Renamed4462 = "минут";
         }
         return _loc4_;
      }
      
      private static function Renamed4464(param1:int, param2:int, param3:int) : Renamed4459
      {
         var _loc4_:Renamed4459 = new Renamed4459();
         if(param3 == 1)
         {
            _loc4_.Renamed4460 = "day";
         }
         else
         {
            _loc4_.Renamed4460 = "days";
         }
         if(param2 == 1)
         {
            _loc4_.Renamed4461 = "hour";
         }
         else
         {
            _loc4_.Renamed4461 = "hours";
         }
         if(param1 == 1 || param1 == 0)
         {
            _loc4_.Renamed4462 = "minute";
         }
         else
         {
            _loc4_.Renamed4462 = "minutes";
         }
         return _loc4_;
      }
      
      private static function Renamed4465(param1:int, param2:int, param3:int) : Renamed4459
      {
         var _loc4_:Renamed4459 = new Renamed4459();
         if(param3 == 1)
         {
            _loc4_.Renamed4460 = "Tag";
         }
         else
         {
            _loc4_.Renamed4460 = "Tage";
         }
         if(param2 == 1)
         {
            _loc4_.Renamed4461 = "Stunde";
         }
         else
         {
            _loc4_.Renamed4461 = "Stunden";
         }
         if(param1 == 1 || param1 == 0)
         {
            _loc4_.Renamed4462 = "Minute";
         }
         else
         {
            _loc4_.Renamed4462 = "Minuten";
         }
         return _loc4_;
      }
      
      private static function Renamed4466(param1:int, param2:int, param3:int) : Renamed4459
      {
         var _loc4_:Renamed4459 = new Renamed4459();
         if(param3 == 1)
         {
            _loc4_.Renamed4460 = "dia";
         }
         else
         {
            _loc4_.Renamed4460 = "dias";
         }
         if(param2 == 1)
         {
            _loc4_.Renamed4461 = "hora";
         }
         else
         {
            _loc4_.Renamed4461 = "horas";
         }
         if(param1 == 1 || param1 == 0)
         {
            _loc4_.Renamed4462 = "minuto";
         }
         else
         {
            _loc4_.Renamed4462 = "minutos";
         }
         return _loc4_;
      }
      
      private static function Renamed4467(param1:int, param2:int, param3:int) : Renamed4459
      {
         var _loc4_:Renamed4459 = new Renamed4459();
         if(param3 == 1)
         {
            _loc4_.Renamed4460 = "día";
         }
         else
         {
            _loc4_.Renamed4460 = "días";
         }
         if(param2 == 1)
         {
            _loc4_.Renamed4461 = "hora";
         }
         else
         {
            _loc4_.Renamed4461 = "horas";
         }
         if(param1 == 1 || param1 == 0)
         {
            _loc4_.Renamed4462 = "minuto";
         }
         else
         {
            _loc4_.Renamed4462 = "minutos";
         }
         return _loc4_;
      }
      
      private static function Renamed4468() : Renamed4459
      {
         var _loc1_:Renamed4459 = new Renamed4459();
         _loc1_.Renamed4460 = "天";
         _loc1_.Renamed4461 = "小时";
         _loc1_.Renamed4462 = "分鐘";
         return _loc1_;
      }
      
      private static function Renamed4469(param1:int, param2:int, param3:int) : Renamed4459
      {
         var _loc4_:Renamed4459 = new Renamed4459();
         if(param3 == 1)
         {
            _loc4_.Renamed4460 = "dzień";
         }
         else
         {
            _loc4_.Renamed4460 = "dni";
         }
         if(param2 == 1)
         {
            _loc4_.Renamed4461 = "godzina";
         }
         else
         {
            _loc4_.Renamed4461 = "godzin";
         }
         if(param1 == 0)
         {
            _loc4_.Renamed4462 = "minut";
         }
         else if(param1 == 1)
         {
            _loc4_.Renamed4462 = "minuta";
         }
         else if(param1 >= 2 && param1 <= 4 || param1 >= 22 && param1 <= 24 || param1 >= 32 && param1 <= 34 || param1 >= 42 && param1 <= 44 || param1 >= 52 && param1 <= 54)
         {
            _loc4_.Renamed4462 = "minuty";
         }
         else
         {
            _loc4_.Renamed4462 = "minut";
         }
         return _loc4_;
      }
      
      private static function Renamed4470(param1:int, param2:int, param3:int) : Renamed4459
      {
         var _loc4_:Renamed4459 = new Renamed4459();
         param3 %= 100;
         if(param3 >= 11 && param3 <= 19)
         {
            _loc4_.Renamed4460 = "днів";
         }
         else
         {
            param3 %= 10;
            if(param3 == 1)
            {
               _loc4_.Renamed4460 = "день";
            }
            else if(param3 >= 2 && param3 <= 4)
            {
               _loc4_.Renamed4460 = "дня";
            }
            else
            {
               _loc4_.Renamed4460 = "днів";
            }
         }
         if(param2 == 1 || param2 == 21)
         {
            _loc4_.Renamed4461 = "година";
         }
         else if(param2 >= 2 && param2 <= 4 || param2 >= 22 && param2 <= 24)
         {
            _loc4_.Renamed4461 = "години";
         }
         else if(param2 >= 5 && param2 <= 20)
         {
            _loc4_.Renamed4461 = "годин";
         }
         if(param1 == 0 || param1 == 1 || param1 == 21 || param1 == 31 || param1 == 41 || param1 == 51)
         {
            _loc4_.Renamed4462 = "хвилину";
         }
         else if(param1 >= 2 && param1 <= 4 || param1 >= 22 && param1 <= 24 || param1 >= 32 && param1 <= 34 || param1 >= 42 && param1 <= 44 || param1 >= 52 && param1 <= 54)
         {
            _loc4_.Renamed4462 = "хвилини";
         }
         else if(param1 >= 5 && param1 <= 20 || param1 >= 25 && param1 <= 30 || param1 >= 35 && param1 <= 40 || param1 >= 45 && param1 <= 50 || param1 >= 55 && param1 <= 60)
         {
            _loc4_.Renamed4462 = "хвилин";
         }
         return _loc4_;
      }
      
      public function Renamed3953(param1:int, param2:int, param3:int) : String
      {
         var _loc4_:String = "";
         var _loc5_:Renamed4459 = this.Renamed4458(param1,param2,param3);
         if(param3 == 0 && param2 == 0 && param1 == 0)
         {
            return "1 " + _loc5_.Renamed4462;
         }
         if(param3 != 0)
         {
            _loc4_ = param3 + " " + _loc5_.Renamed4460;
         }
         if(param2 != 0)
         {
            _loc4_ = _loc4_ + " " + param2 + " " + _loc5_.Renamed4461;
         }
         if(param1 != 0)
         {
            _loc4_ = _loc4_ + " " + param1 + " " + _loc5_.Renamed4462;
         }
         return _loc4_;
      }
      
      public function Renamed2274(param1:int) : String
      {
         return param1 + " " + this.Renamed2272(param1);
      }
      
      public function Renamed2272(param1:int) : String
      {
         return this.Renamed4458(0,0,param1).Renamed4460;
      }
      
      public function Renamed4458(param1:int, param2:int, param3:int) : Renamed4459
      {
         switch(localeService.language)
         {
            case "ru":
               return Renamed4463(param1,param2,param3);
            case "de":
               return Renamed4465(param1,param2,param3);
            case "pt_BR":
               return Renamed4466(param1,param2,param3);
            case "pl":
               return Renamed4469(param1,param2,param3);
            case "es":
               return Renamed4467(param1,param2,param3);
            case "cn":
               return Renamed4468();
            case "ua":
               return Renamed4470(param1,param2,param3);
            case "en":
         }
         return Renamed4464(param1,param2,param3);
      }
   }
}

