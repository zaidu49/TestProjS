<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestProjS._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <div class="jumbotron">
        <h1>Scanner Demo</h1>
    </div>

    <div>
        <label for="textInput">Scan Data:</label>
        <input type="text" id="textInput" runat="server" />
        <br />
        <asp:Button ID="submitButton" runat="server" Text="Submit" OnClientClick="submitForm(); return false;" OnClick="SubmitButton_Click" />
    </div>
    <div style="display: flex; justify-content: center;">
        <div id="code-reader" style="width: 500px;"></div>
    </div>
    <div id="scan-result"></div>
    <%--<asp:ScriptManager ID="ScriptManager2" runat="server" EnablePageMethods="true"></asp:ScriptManager>--%>

    <%--<button type="button" id="btnCallServerMethod" onclick="callServerMethod()">Call Server Method</button>--%>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://unpkg.com/html5-qrcode"></script>
    <script>
        function dataScanned(decodeText) {
            console.log("here-" + decodeText);
            var parameterValue = decodeText;
            $('#submitButton').click()
            document.getElementById('<%= submitButton.ClientID %>').click();
            ////document.getElementById('myFormForm.ClientID %>').submit();
            //PageMethods.ScanResult(parameterValue, onSuccess, onError);
            //jQuery.ajax({
            //    type: "POST",
            //    url: "Default.aspx/ScanResult",
            //    data: JSON.stringify({ parameter: parameterValue }),
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (result) {
            //        console.log("Success:", result.d);
            //        onSuccess(result.d);
            //    },
            //    error: function (error) {
            //        console.log("Error:", error.responseText);
            //        onError(error.responseText);
            //    }
            //});
        }
        function DOMReady(fn) {
            if (document.readyState === "complete" || document.readyState === "interactive") {
                setTimeout(fn, 1);
            } else {
                document.addEventListener("DOMContentLoaded", fn)
                var decodeText = "initializing";
                $('#scanResult').val(decodeText);
                console.log(decodeText);
                //dataScanned(decodeText);
            }
        }

        DOMReady(function () {
            var myQR = document.getElementById('scan-result');
            lastResult = 0;
            countResult = 0;

            function onScanSuccess(decodeText, decodeResult) {
                console.log("success");
                if (decodeText != lastResult) {
                    ++countResult;
                    lastResult = decodeResult;

                    alert("Scanned Data: " + decodeText, decodeResult)
                    myQR.innerHTML = "you scanned: " + decodeText;
                    if (decodeText != 'undefined' && decodeText != null && decodeText != '') {
                        $('#scanResult').val(decodeText);
                        $('#MainContent_textInput').val(decodeText);
                        var inputValue = document.getElementById('<%= textInput.ClientID %>').value;
                        console.log("after change" + inputValue);
                        dataScanned(decodeText);
                    }
                }
            }
            var htmlScanner = new Html5QrcodeScanner("code-reader", { fps: 10, qrbox: 250 });

            htmlScanner.render(onScanSuccess);
        })
    </script>
</asp:Content>

