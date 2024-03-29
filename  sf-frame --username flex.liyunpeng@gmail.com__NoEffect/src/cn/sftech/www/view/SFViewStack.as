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
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			return super.addChildAt(child,index);
		}
		
		override public function removeChildAt(index:int):DisplayObject
		{
			if(numChildren -1 > _selectedIndex) {
			} else if(_selectedIndex != 0) {
				_selectedIndex --;
			}
			
			if(_oldSelectedIndex > _selectedIndex) {
				_oldSelectedIndex --;
			}
			
			changeViewItem();
			return super.removeChildAt(index);
		}
		
		public function getItemAt(value : uint) : DisplayObject
		{
			return getChildAt(value);
		}
		
		public function getItemIndex(child : DisplayObject) : int
		{
			return getChildIndex(child);
		}
		
		public function getItemCount() : uint
		{
			return numChildren;
		}
		
		private function changeViewItem() : void
		{
			getChildAt(_oldSelectedIndex).visible = false;
			getChildAt(_selectedIndex).visible = true;
		}
		
	}
}