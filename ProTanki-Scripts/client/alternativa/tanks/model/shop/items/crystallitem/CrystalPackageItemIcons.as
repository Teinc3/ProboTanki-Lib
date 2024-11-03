package alternativa.tanks.model.shop.items.crystallitem
{
   import flash.display.BitmapData;
   
   public class CrystalPackageItemIcons
   {
      private static const crystalBlueClass:Class = CrystalPackageItemIcons_crystalBlueClass;
      
      public static const crystalBlue:BitmapData = new crystalBlueClass().bitmapData;
      
      private static const crystalWhiteClass:Class = CrystalPackageItemIcons_crystalWhiteClass;
      
      public static const crystalWhite:BitmapData = new crystalWhiteClass().bitmapData;
      
      private static const premiumClass:Class = CrystalPackageItemIcons_premiumClass;
      
      public static const premium:BitmapData = new premiumClass().bitmapData;
      
      private static const crystalsPackage1Class:Class = CrystalPackageItemIcons_crystalsPackage1Class;
      
      private static const crystalsPackage2Class:Class = CrystalPackageItemIcons_crystalsPackage2Class;
      
      private static const crystalsPackage3Class:Class = CrystalPackageItemIcons_crystalsPackage3Class;
      
      private static const crystalsPackage4Class:Class = CrystalPackageItemIcons_crystalsPackage4Class;
      
      private static const crystalsPackage5Class:Class = CrystalPackageItemIcons_crystalsPackage5Class;
      
      public static const crystalsPackages:Array = [null,new crystalsPackage1Class().bitmapData,new crystalsPackage2Class().bitmapData,new crystalsPackage3Class().bitmapData,new crystalsPackage4Class().bitmapData,new crystalsPackage5Class().bitmapData];
      
      public function CrystalPackageItemIcons()
      {
         super();
      }
   }
}

