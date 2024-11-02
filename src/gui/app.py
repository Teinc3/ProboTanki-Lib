import sys
import os
from PyQt5.QtWidgets import QApplication, QMainWindow, QTextEdit, QVBoxLayout, QWidget
from PyQt5.QtCore import QTimer, Qt


class LogMonitor(QMainWindow):
    def __init__(self, log_file):
        super().__init__()
        self.log_file = log_file
        self.last_position = 0

        self.setWindowTitle("Log Monitor")
        self.setGeometry(100, 100, 1280, 720)

        self.console = QTextEdit(self)
        self.console.setReadOnly(True)
        self.console.setAlignment(Qt.AlignLeft)

        self.console.setLineWrapMode(QTextEdit.NoWrap)
        self.console.setHorizontalScrollBarPolicy(Qt.ScrollBarAlwaysOff)
        self.console.setVerticalScrollBarPolicy(Qt.ScrollBarAlwaysOff)

        layout = QVBoxLayout()
        layout.addWidget(self.console)

        container = QWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)

        self.timer = QTimer(self)
        self.timer.timeout.connect(self.update_log)
        self.timer.start(1)

        self.show()

    def update_log(self):
        if os.path.exists(self.log_file):
            with open(self.log_file, 'r') as file:
                file.seek(self.last_position)
                new_lines = file.readlines()
                self.last_position = file.tell()

                if new_lines:
                    for line in new_lines:
                        self.console.append(line.strip())


if __name__ == "__main__":
    app = QApplication(sys.argv)

    log_file_path = os.path.join(os.path.dirname(__file__), '../logs/tcp.log')
    window = LogMonitor(log_file_path)
    sys.exit(app.exec_())
