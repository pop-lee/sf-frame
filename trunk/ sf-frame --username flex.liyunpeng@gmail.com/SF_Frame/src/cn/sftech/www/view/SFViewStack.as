package cn.sftech.www.view
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	public class SFViewStack extends SFContainer
	{
		private var _selectedIndex : int = 0;
		
		private var _oldSelectedIndex : int = 0;
		
		public function SFViewStack()
		{
			super();
		}
		
		public function set selectedIndex(value : int) : void
		{
			_oldSelectedIndex = _selectedIndex;
			_selectedIndex = value;
			
			changeViewItem();
		}
		
		public function get selectedIndex() : int
		{
			return _selectedIndex;
		}
		
		public function addItem(item : SFContainer) : void
		{
			item.visible = false;
			addChild(item);
			
			changeViewItem();
		}
		
		public function removeItem(item : SFContainer) : void
		{
			removeChild(item);
		}
		
		private function changeViewItem() : void
		{
			getChildAt(_oldSelectedIndex).visible = false;
			getChildAt(_selectedIndex).visible = true;
		}
		
	}
}