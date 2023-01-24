<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to enable context menu items depending on selected ASPxGridView rows</title>
	<script type="text/javascript">
		function SetContextMenuItemEnabled(s, e) {
			var key = s.GetRowKey(e.visibleIndex);
			var item = pm.GetItem(key);
			item.SetEnabled(!e.isSelected);
		}
		function ShowContextMenu(s, e) {
			if (e.objectType === "row") {
				var x = ASPxClientUtils.GetEventX(e.htmlEvent);
				var y = ASPxClientUtils.GetEventY(e.htmlEvent);
				pm.ShowAtPos(x, y);
			}
		}
		function DoAction(s, e) {
			switch (e.item.name) {
				case "mi0":
					alert("Action0 simulation");
					break;
				case "mi1":
					alert("Action1 simulation");
					break;
				case "mi2":
					alert("Action2 simulation");
					break;
				case "mi3":
					alert("Action3 simulation");
					break;
				case "mi4":
					alert("Action4 simulation");
					break;
			}
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<dx:ASPxGridView ID="gv" ClientInstanceName="gv" runat="server" AutoGenerateColumns="False"
			KeyFieldName="ID">
			<ClientSideEvents ContextMenu="ShowContextMenu" SelectionChanged="SetContextMenuItemEnabled" />
			<Columns>
				<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
				</dx:GridViewCommandColumn>
				<dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Item" VisibleIndex="2">
				</dx:GridViewDataTextColumn>
			</Columns>
		</dx:ASPxGridView>
		<dx:ASPxPopupMenu ID="pm" ClientInstanceName="pm" runat="server">
			<ClientSideEvents ItemClick="DoAction" />
			<Items>
				<dx:MenuItem Name="mi0" Text="Action0">
				</dx:MenuItem>
				<dx:MenuItem Name="mi1" Text="Action1">
				</dx:MenuItem>
				<dx:MenuItem Name="mi2" Text="Action2">
				</dx:MenuItem>
				<dx:MenuItem Name="mi3" Text="Action3">
				</dx:MenuItem>
				<dx:MenuItem Name="mi4" Text="Action4">
				</dx:MenuItem>
			</Items>
		</dx:ASPxPopupMenu>
	</form>
</body>
</html>