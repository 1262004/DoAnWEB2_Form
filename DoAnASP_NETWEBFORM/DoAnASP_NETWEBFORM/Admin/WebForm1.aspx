<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Jtable/metroblue/jquery-ui.css" rel="stylesheet" />
    <link href="Jtable/themes/jqueryui/jtable_jqueryui.css" rel="stylesheet" />
    <link href="Jtable/themes/metro/blue/jtable.css" rel="stylesheet" />


    <title></title>
</head>
<body>
    

    <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
	<fieldset>
		<input class="full-width" type="hidden" name="business" value="hop-facilitator@gmail.com">
		<input type="hidden" name="cmd" value="_xclick">
		<input type="hidden" name="item_name" value="The unlimited music download subscription">
		<input type="hidden" name="amount" value="9">
		<input type="hidden" name="no_shipping" value="1">
		<input type=hidden name=RETURNURL value="http://localhost:1721/Admin/WebForm2.aspx">
		<input type="hidden" name="return" value="http://localhost:1721/Admin/WebForm2.aspx">
		<input type="hidden" name="notify_url" value="http://localhost:1721/Admin/WebForm2.aspx">
    <input type="hidden" name="cancel_return" value="http://localhost:1721/Admin/WebForm2.aspx">
		<button type="submit">Order now!</button>
	</fieldset>
</form>
    
</body>
</html>
