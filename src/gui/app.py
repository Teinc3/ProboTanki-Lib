import os
import sys

from PyQt5.QtCore import QTimer, Qt
from PyQt5.QtWidgets import QApplication, QMainWindow, QTextEdit, QLineEdit, QPushButton, QVBoxLayout, QWidget, \
    QHBoxLayout


def parse_search_input(input_text):
    if not input_text:
        return []  # Return an empty list if there's no input

    and_conditions = input_text.split("&&")
    processed_conditions = []
    for and_condition in and_conditions:
        or_conditions = and_condition.split("||")
        processed_or_conditions = []
        for condition in or_conditions:
            condition = condition.strip()
            processed_or_conditions.append(condition)
        if processed_or_conditions:  # Ensure no empty lists are added
            processed_conditions.append(processed_or_conditions)
    return processed_conditions


def check_line_against_conditions(line, conditions):
    for or_conditions in conditions:
        if any(keyword.lower() in line.lower() for keyword in or_conditions):
            continue
        else:
            return False
    return True


class LogViewer(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("ProTanki TCP Log Viewer")
        self.setGeometry(100, 100, 1280, 720)

        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)
        self.layout = QVBoxLayout()
        self.central_widget.setLayout(self.layout)

        self.search_layout = QHBoxLayout()
        self.search_bar = QLineEdit(self)
        self.search_bar.setPlaceholderText("Search logs...")
        self.search_bar.returnPressed.connect(self.search_logs)
        self.search_layout.addWidget(self.search_bar)

        self.search_button = QPushButton("Search", self)
        self.search_button.clicked.connect(self.search_logs)
        self.search_layout.addWidget(self.search_button)

        self.layout.addLayout(self.search_layout)

        self.log_display = QTextEdit(self)
        self.log_display.setReadOnly(True)
        self.log_display.setLineWrapMode(QTextEdit.NoWrap)
        self.log_display.setHorizontalScrollBarPolicy(Qt.ScrollBarAlwaysOn)
        self.layout.addWidget(self.log_display)

        self.timer = QTimer(self)
        self.timer.timeout.connect(self.check_new_logs)
        self.timer.start(25)

        self.log_file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../logs/tcp.log'))
        self.last_position = 0
        self.chunk_size = 200
        self.search_keywords = []

    def check_new_logs(self):
        try:
            with open(self.log_file_path, 'r', encoding='utf-8', errors='ignore') as log_file:
                log_file.seek(self.last_position)
                for _ in range(self.chunk_size):
                    line = log_file.readline()
                    if not line:
                        break

                    # Skip lines that contain "NoDisp" and do not contain any of the search keywords 
                    # If they contain a search keyword, then we still disp them - except "IN" and "OUT"
                    if "NoDisp" in line and not any(
                            keyword in line and keyword not in ["<IN>", "<OUT>"]
                            for conditions in self.search_keywords
                            for keyword in conditions
                    ):
                        continue

                    if check_line_against_conditions(line, self.search_keywords):
                        self.log_display.append(line.strip())
                self.last_position = log_file.tell()
        except FileNotFoundError:
            self.log_display.append("Something went wrong, check the log file")

    def search_logs(self):
        raw_input = self.search_bar.text().strip()
        self.search_keywords = parse_search_input(raw_input)
        self.log_display.clear()
        self.last_position = 0
        self.check_new_logs()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    viewer = LogViewer()
    viewer.show()
    sys.exit(app.exec_())
