package cn.sftech.www.view
{
	import cn.sftech.www.effect.base.SFViewStackEffect;
	import cn.sftech.www.effect.viewStackEffect.SFViewStackListEffect;
	import cn.sftech.www.event.SFPropertyChangeEvent;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	public class SFViewStack extends SFContainer
	{
		private var _selectedIndex : int = 0;
		
		private var _oldSelectedIndex : int = 0;
		
		private var _effect : SFViewStackEffect;
		
		public function SFViewStack()
		{
			super();
		}
		
		public function set selectedIndex(value : int) : void
		{
			_oldSelectedIndex = _selectedIndex;
			_selectedIndex = value;
			
			changeViewItem();
			this.dispatchEvent(new SFPropertyChangeEvent());
		}
		
		[Bindable(event="propertyChangeEvent")]
		public function get selectedIndex() : int
		{
			return _selectedIndex;
		}
		
		public function get oldSelectIndex() : int
		{
			return _oldSelectedIndex;
		}
		
		public function set effect(effect : SFViewStackEffect) : void
		{
			_effect = effect
			_effect.target = this;
		}
		
		public function addItem(item : DisplayObject) : void
		{
			item.visible = false;
			addChild(item);
			
			changeViewItem();
		}
		
		public function removeItem(item : DisplayObject) : void
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