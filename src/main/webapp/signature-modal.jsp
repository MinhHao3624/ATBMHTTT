<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    /* Dinh dang cho vung nen mo o phia sau */
    .modal-overlay {
        display: none;
        position: fixed;
        top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0, 0, 0, 0.6);
        z-index: 9999;
        justify-content: center;
        align-items: center;
    }

    /* Dinh dang cho khung noi dung popup chinh */
    .modal-content {
        background: #ffffff;
        width: 550px;
        max-width: 90%;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 8px 30px rgba(0,0,0,0.3);
        position: relative;
        animation: animateslide 0.3s ease-out;
    }

    @keyframes animateslide {
        from { transform: translateY(-50px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    /* Dinh dang cho nut dong popup */
    .close-btn {
        position: absolute;
        top: 15px; right: 20px;
        font-size: 28px;
        cursor: pointer;
        color: #a4b0be;
        transition: 0.2s;
    }
    .close-btn:hover { color: #2f3542; }

    /* Dinh dang cho tieu de cua popup */
    .modal-title {
        margin-top: 0;
        color: #2f3542;
        font-size: 22px;
        border-bottom: 2px solid #f1f2f6;
        padding-bottom: 12px;
        margin-bottom: 20px;
    }

    /* Dinh dang cho cac khoi tung buoc ben trong */
    .step-group {
        margin-bottom: 20px;
        padding: 15px;
        background: #f8f9fa;
        border-radius: 8px;
        border: 1px solid #dfe4ea;
    }
    .step-title {
        font-weight: 600;
        margin-bottom: 10px;
        display: block;
        color: #3742fa;
        font-size: 14px;
    }

    /* Dinh dang cho cac o nhap lieu va the lua chon */
    .modal-content textarea,
    .modal-content input[type="text"],
    .modal-content select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ced6e0;
        border-radius: 6px;
        box-sizing: border-box;
        font-family: monospace;
        font-size: 13px;
    }
    .modal-content textarea { resize: none; height: 70px; background: #fffaf0; }
    .hash-result { background: #f1f9f5; color: #2ed573; font-weight: bold; }

    /* Dinh dang cho vung keo tha hoac chon file */
    .file-drop-area {
        border: 2px solid #70a1ff;
        border-radius: 6px;
        padding: 20px;
        text-align: center;
        background: #ffffff;
        cursor: pointer;
        transition: 0.3s;
    }
    .file-drop-area:hover { background: #f1f2f6; border-color: #3742fa; }
    .file-drop-area input { display: none; }

    /* Dinh dang cho nut bam thuc thi chinh */
    .btn-action {
        width: 100%;
        padding: 14px;
        background-color: #2ed573;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.2s;
        box-shadow: 0 4px 6px rgba(46, 213, 115, 0.2);
    }
    .btn-action:hover { background-color: #26de81; }

    /* Dinh dang cho dong chu thong bao trang thai thanh cong */
    .text-success { color: #2ed573; font-size: 13px; margin-top: 8px; display: none; font-weight: 500;}
</style>

<div class="modal-overlay" id="signatureToolModal">
    <div class="modal-content">
        <span class="close-btn" id="btnCloseSigModal">x</span>
        <h3 class="modal-title">Xác Thực Đơn Hàng Bằng Chữ Ký Điện Tử</h3>

        <div class="step-group">
            <span class="step-title">Thông tin đơn hàng gốc</span>
            <textarea id="orderDataString" readonly placeholder="Hệ thống đang chuẩn bị chuỗi đơn hàng">${sessionScope.orderDataString}</textarea>
        </div>

        <div class="step-group">
            <span class="step-title">Lựa chọn thuật toán Băm và Loại khóa</span>
            <div style="display: flex; gap: 10px; margin-bottom: 10px;">
                <select id="hashAlgorithm" style="flex: 1;">
                    <option value="SHA256">Băm SHA 256</option>
                    <option value="MD5">Băm MD5</option>
                </select>
                <select id="cryptoAlgorithm" style="flex: 1;">
                    <option value="RSA">RSA</option>
                    <option value="DSA">DSA</option>
                </select>
            </div>
            <button type="button" id="btnExecuteHash" style="width: 100%; padding: 8px; margin-bottom: 10px; cursor: pointer; border-radius: 6px; border: 1px solid #ced6e0; background: #fff;">Tạo chuỗi băm/button>
            <input type="text" id="hashOutputValue" class="hash-result" readonly placeholder="Chuỗi kết quả băm sẽ hiển thị tại đây">
        </div>

        <div class="step-group">
            <span class="step-title">Tải file Private Key</span>
            <div class="file-drop-area" id="keyFileArea">
                <span id="keyFileText">Nhấp vào đây để chọn file private key</span>
                <input type="file" id="inputPrivateKeyFile" accept=".txt,.pem,.key">
            </div>
            <div id="keyReadSuccess" class="text-success">Đã đọc thành công Private key của bạn</div>
        </div>

        <button class="btn-action" id="btnSubmitSignature">Ký VÀ HOÀN TẤT THANH TOÁN</button>
    </div>
</div>

<script>
    /* Javascript co ban de dong mo giao dien popup */
    const sigModal = document.getElementById('signatureToolModal');
    const btnCloseSig = document.getElementById('btnCloseSigModal');

    function openSignatureTool() {
        sigModal.style.display = 'flex';
    }

    btnCloseSig.addEventListener('click', function() {
        sigModal.style.display = 'none';
    });

    window.addEventListener('click', function(e) {
        if (e.target === sigModal) {
            sigModal.style.display = 'none';
        }
    });

    /* Javascript co ban de cap nhat ten file hien thi khi nguoi dung chon file */
    const keyFileArea = document.getElementById('keyFileArea');
    const inputPrivateKeyFile = document.getElementById('inputPrivateKeyFile');
    const keyFileText = document.getElementById('keyFileText');
    const keyReadSuccess = document.getElementById('keyReadSuccess');

    keyFileArea.addEventListener('click', function() {
        inputPrivateKeyFile.click();
    });

    inputPrivateKeyFile.addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            keyFileText.innerText = file.name;
            keyReadSuccess.style.display = 'block';
        }
    });
</script>

<button onclick="openSignatureTool()" style="margin: 50px; padding: 20px; font-size: 16px; cursor: pointer;">Bấm vào đây để test mở Popup</button>