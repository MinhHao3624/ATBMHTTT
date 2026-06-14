<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <style>
        /* css cho tong the trang quan ly khoa */
        .security-container {
            font-family: sans-serif;
            max-width: 800px;
            margin: 20px auto;
            color: #2f3542;
        }

        /* css cho the chua cac chuc nang */
        .sec-card {
            background: #fff;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 25px;
            border: 1px solid #f1f2f6;
        }

        /* css cho tieu de cua tung the */
        .sec-title {
            font-size: 18px;
            color: #3742fa;
            border-bottom: 2px solid #f1f2f6;
            padding-bottom: 10px;
            margin-top: 0;
            margin-bottom: 20px;
        }

        /* css cho the hien thi trang thai */
        .sec-status {
            padding: 15px;
            border-radius: 6px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .status-active {
            background: #e8f8f5;
            color: #2ed573;
            border: 1px solid #2ed573;
        }

        .status-none {
            background: #fff3cd;
            color: #856404;
            border: 1px solid #ffeeba;
        }

        /* css cho cac nhom nhap lieu */
        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            font-size: 14px;
        }

        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced6e0;
            font-family: monospace;
        }

        /* css cho cac loai nut bam */
        .btn-sec {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.2s;
            color: white;
        }

        .btn-primary {
            background: #3742fa;
        }

        .btn-primary:hover {
            background: #5352ed;
        }

        .btn-warning {
            background: #ffa502;
        }

        .btn-warning:hover {
            background: #eccc68;
        }

        .btn-danger {
            background: #ff4757;
        }

        .btn-danger:hover {
            background: #ff6b81;
        }

        /* css cho vung chon file */
        .file-drop {
            border: 2px dashed #a4b0be;
            padding: 15px;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
            background: #f8f9fa;
            font-size: 13px;
            margin-bottom: 10px;
        }

        .file-drop:hover {
            border-color: #3742fa;
            background: #f1f2f6;
        }

        .file-drop input {
            display: none;
        }

        .file-success {
            color: #2ed573;
            font-weight: bold;
            display: none;
            margin-bottom: 10px;
            font-size: 12px;
        }

        /* css cho thanh dieu huong cho phan bao mat khoa */
        .nav-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }

        .nav-tab {
            padding: 8px 15px;
            background: #f1f2f6;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .nav-tab.active {
            background: #ff4757;
            color: white;
            font-weight: bold;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }
    </style>

    <div class="security-container">
        <div style="margin-bottom: 20px;">
            <a href="http://localhost:8080/MobileWebApp/account-login?userID=${sessionScope.khachHang.userID}"
                style="text-decoration: none; color: #2f3542; font-weight: bold; font-size: 14px; padding: 8px 15px; background-color: #f1f2f6; border-radius: 5px; transition: 0.2s;">
                &#8592; Quay lại hồ sơ
            </a>
        </div>

        <h2>Quản Lý Khoá Bảo Mật Chữ Ký Điện Tử</h2>

        <div class="sec-card">
            <h3 class="sec-title">1 Thiet Lap Khoa Moi</h3>
            <div class="sec-status status-none" id="keyStatusText">
                Tài khoản chưa có cặp khóa bảo mật hoặc khóa đã bị hủy
            </div>

            <div class="form-group">
                <label>Thuật toán mã hóa</label>
                <select id="algoSelect" disabled>
                    <option value="RSA">RSA</option>
                </select>
            </div>
            <button class="btn-sec btn-primary" id="btnGenerateKey">Tạo Cặp Khóa Mới</button>

            <div id="downloadKeyArea"
                style="display: none; margin-top: 15px; padding: 15px; background: #e8f8f5; border-radius: 6px; border: 1px solid #2ed573;">
                <p style="color: #2ed573; font-weight: bold; margin-top: 0;">tạo khóa thành công vui lòng tải khóa về
                    máy và cất giữ cẩn thận</p>
                <div style="display: flex; gap: 10px;">
                    <button class="btn-sec btn-primary" id="btnDownloadPublicKey">Tải Public Key</button>
                    <button class="btn-sec btn-danger" id="btnDownloadPrivateKey">Tải Private Key</button>
                </div>
            </div>
        </div>

        <div class="sec-card">
            <h3 class="sec-title">2 Cập Nhật / Đổi Khóa</h3>
            <p style="font-size: 13px;">Yêu cầu nạp file Private Key cũ để chứng minh danh tính trước khi hệ thống thu
                hồi khóa cũ và cấp khóa mới.</p>

            <div class="form-group">
                <label>Nạp Private Key cũ</label>
                <div class="file-drop" id="dropOldPri">Nhấn vào đây để nạp file private key cũ</div>
                <input type="file" id="fileOldPri" accept=".txt,.pem,.key">
                <div id="msgOldPri" class="file-success">Đã nạp Private Key cũ</div>
            </div>

            <button class="btn-sec btn-warning" id="btnUpdateKey">Xác Thực & Tạo Khóa Mới</button>
        </div>

        <div class="sec-card">
            <h3 class="sec-title">3 Xử Lý Sự Cố Mất Khóa</h3>

            <div class="nav-tabs">
                <div class="nav-tab active" id="tabLostPubBtn">Tôi mất Public Key</div>
                <div class="nav-tab" id="tabLostPriBtn">Tôi mất Private Key</div>
            </div>

            <div id="lostPub" class="tab-content active">
                <p style="font-size: 14px;">Khóa công khai của bạn được lưu trữ an toàn trên CA Server. Nhấn nút bên
                    dưới để tải lại từ Server.</p>
                <button class="btn-sec btn-primary" id="btnSendPubToMail">Tải Lại Public Key Từ Server</button>
            </div>

            <div id="lostPri" class="tab-content">
                <p style="font-size: 14px; color: #ff4757;">Nếu mất Private Key, bạn buộc phải hủy bỏ (Revoke) chứng chỉ
                    hiện tại và tạo lại khóa mới. Nhấn nút bên dưới để xác nhận.</p>
                <button class="btn-sec btn-danger" id="btnReportLostPri">Xác Nhận Hủy Khóa Cũ</button>
            </div>
        </div>
    </div>

    <script>
        /* javascript co ban de chuyen doi giua hai the bao mat khoa */
        const tabLostPubBtn = document.getElementById('tabLostPubBtn');
        const tabLostPriBtn = document.getElementById('tabLostPriBtn');
        const lostPubContent = document.getElementById('lostPub');
        const lostPriContent = document.getElementById('lostPri');

        tabLostPubBtn.addEventListener('click', function () {
            tabLostPubBtn.classList.add('active');
            tabLostPriBtn.classList.remove('active');
            lostPubContent.classList.add('active');
            lostPriContent.classList.remove('active');
        });

        tabLostPriBtn.addEventListener('click', function () {
            tabLostPriBtn.classList.add('active');
            tabLostPubBtn.classList.remove('active');
            lostPriContent.classList.add('active');
            lostPubContent.classList.remove('active');
        });

        /* javascript co ban de hien thi ten file khi nguoi dung chon file private key cu */
        const dropOldPri = document.getElementById('dropOldPri');
        const fileOldPri = document.getElementById('fileOldPri');
        const msgOldPri = document.getElementById('msgOldPri');

        dropOldPri.addEventListener('click', function () {
            fileOldPri.click();
        });

        fileOldPri.addEventListener('change', function (e) {
            const file = e.target.files[0];
            if (file) {
                dropOldPri.innerText = file.name;
                msgOldPri.style.display = 'block';
            }
        });

        const btnGenerateKey = document.getElementById('btnGenerateKey');
        const downloadKeyArea = document.getElementById('downloadKeyArea');
        const btnDownloadPublicKey = document.getElementById('btnDownloadPublicKey');
        const btnDownloadPrivateKey = document.getElementById('btnDownloadPrivateKey');

        let generatedPublicKey = '';
        let generatedPrivateKey = '';
        const currentOwner = '${sessionScope.khachHang.userName}'; // assuming userName holds the owner ID

        btnGenerateKey.addEventListener('click', async function () {
            try {
                btnGenerateKey.disabled = true;
                btnGenerateKey.innerText = 'Đang khởi tạo khóa...';

                // 1. Gọi generate-key
                const genRes = await fetch('${pageContext.request.contextPath}/ca-proxy/generate-key', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' }
                });
                const keyPair = await genRes.json();
                generatedPublicKey = keyPair.publicKey;
                generatedPrivateKey = keyPair.privateKey;

                // 2. Gọi register
                const regRes = await fetch('${pageContext.request.contextPath}/ca-proxy/register', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        owner: currentOwner,
                        publicKey: generatedPublicKey
                    })
                });
                
                if (!regRes.ok) {
                    const err = await regRes.text();
                    alert("Đăng ký thất bại: " + err);
                    throw new Error("Register failed");
                }
                
                const certData = await regRes.json();
                
                // Lưu serial number
                localStorage.setItem('ca_serial_number', certData.serialNumber);

                // Hien thi
                downloadKeyArea.style.display = 'block';
                document.getElementById('keyStatusText').className = 'sec-status status-active';
                document.getElementById('keyStatusText').innerText = 'Tài khoản của bạn đang được bảo vệ bằng chữ ký số';
            } catch(e) {
                console.error(e);
            } finally {
                btnGenerateKey.innerText = 'Tạo Cặp Khóa Mới';
                btnGenerateKey.disabled = false;
            }
        });

        function downloadFile(filename, content) {
            const element = document.createElement('a');
            element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(content));
            element.setAttribute('download', filename);
            element.style.display = 'none';
            document.body.appendChild(element);
            element.click();
            document.body.removeChild(element);
        }

        btnDownloadPublicKey.addEventListener('click', function () {
            downloadFile('public_key.pem', generatedPublicKey);
        });

        btnDownloadPrivateKey.addEventListener('click', function () {
            downloadFile('private_key.pem', generatedPrivateKey);
        });

        // Tinh nang huy khoa
        const btnReportLostPri = document.getElementById('btnReportLostPri');
        btnReportLostPri.addEventListener('click', async function() {
            const serial = localStorage.getItem('ca_serial_number');
            if(!serial) {
                alert("Không tìm thấy Serial Number của khóa trong trình duyệt. Không thể hủy!");
                return;
            }
            if(confirm("Bạn có chắc chắn muốn hủy khóa này không? Khóa cũ sẽ không còn hiệu lực.")) {
                try {
                    const res = await fetch('${pageContext.request.contextPath}/ca-proxy/revoke/' + serial, {
                        method: 'PATCH'
                    });
                    if(res.ok) {
                        alert("Đã hủy khóa thành công!");
                        localStorage.removeItem('ca_serial_number');
                        location.reload();
                    } else {
                        alert("Lỗi khi hủy khóa: " + await res.text());
                    }
                } catch(e) {
                    console.error(e);
                    alert("Lỗi kết nối Server");
                }
            }
        });
    </script>