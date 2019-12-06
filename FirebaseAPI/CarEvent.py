import datetime

class CarEvent(object):
    def __init__(self, isEntry):
        self.isEntry = isEntry
        self.time_stamp = datetime.datetime.now()

    def to_dict(self):
        dest = {
            u'isEntry': self.isEntry,
            u'timeStamp': self.time_stamp,
        }
        return dest
